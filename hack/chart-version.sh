#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <chart-name|chart-dir> [major|minor|patch]"
  echo "   or: $0 <chart-dir> <isMajor> <isMinor> <isPatch> (Renovate postUpgradeTasks)"
  echo "Examples:"
  echo "  $0 prometheus-mixin patch"
  echo "  $0 charts/prometheus-mixin patch"
  echo "  $0 'charts/prometheus-mixin' 'true' '' ''"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

CHART_INPUT="$1"

# Resolve Chart.yaml path:
# - "charts/<name>" or "charts/<name>/values.yaml" (Renovate parentDir/packageFile style)
# - "<name>" (bare chart name)
# - path to Chart.yaml itself
if [[ "${CHART_INPUT}" == */Chart.yaml ]]; then
  CHART_FILE="${CHART_INPUT}"
elif [[ "${CHART_INPUT}" == charts/* ]]; then
  # Strip any trailing file (e.g. values.yaml) keeping charts/<name>
  CHART_DIR=$(echo "${CHART_INPUT}" | cut -d/ -f1,2)
  CHART_FILE="${CHART_DIR}/Chart.yaml"
elif [[ "${CHART_INPUT}" == */* ]]; then
  CHART_FILE="${CHART_INPUT}/Chart.yaml"
else
  CHART_FILE="charts/${CHART_INPUT}/Chart.yaml"
fi

# Resolve version bump type. Defaults to patch (ct requires a version
# increment for any chart change, Renovate appVersion bumps included).
VERSION_TYPE="patch"
if [[ $# -eq 2 ]]; then
  VERSION_TYPE="$2"
elif [[ $# -ge 4 ]]; then
  IS_MAJOR="$2"
  IS_MINOR="$3"
  # IS_PATCH="$4" (default)
  if [[ "${IS_MAJOR}" == "true" ]]; then
    VERSION_TYPE="major"
  elif [[ "${IS_MINOR}" == "true" ]]; then
    VERSION_TYPE="minor"
  else
    VERSION_TYPE="patch"
  fi
fi

if [[ ! -f "$CHART_FILE" ]]; then
  echo "Error: Chart file '$CHART_FILE' not found."
  exit 1
fi

# Read current version (supports optional leading "v" and quoted values)
CURRENT_VERSION=$(grep -E '^version:' "$CHART_FILE" | awk '{print $2}' | tr -d '"'"'"'"' | tr -d "'")
if [[ -z "$CURRENT_VERSION" ]]; then
  echo "Error: version not found in $CHART_FILE"
  exit 1
else
  echo "Current version: ${CURRENT_VERSION}"
fi

# Preserve optional leading "v" (e.g. version: v1.3.0) to keep diff minimal
PREFIX=""
VERSION_NUM="${CURRENT_VERSION}"
if [[ "${VERSION_NUM}" == v* ]]; then
  PREFIX="v"
  VERSION_NUM="${VERSION_NUM#v}"
fi

# Extract major, minor, patch (strip any pre-release/build suffix for bump)
IFS='.' read -r MAJOR MINOR PATCH_REST <<<"$VERSION_NUM"
PATCH=$(echo "${PATCH_REST}" | grep -oE '^[0-9]+' || echo "0")

case "$VERSION_TYPE" in
major)
  MAJOR=$((MAJOR + 1))
  MINOR=0
  PATCH=0
  ;;
minor)
  MINOR=$((MINOR + 1))
  PATCH=0
  ;;
patch)
  PATCH=$((PATCH + 1))
  ;;
*)
  echo "Error: Unknown version type '$VERSION_TYPE'. Use major, minor or patch."
  exit 1
  ;;
esac
NEW_VERSION="${PREFIX}${MAJOR}.${MINOR}.${PATCH}"

# Replace the version in the file
sed -i.bak "s/^version: .*/version: ${NEW_VERSION}/" "$CHART_FILE"
rm -f "${CHART_FILE}.bak"
echo "Updated $CHART_FILE: $CURRENT_VERSION -> $NEW_VERSION"
