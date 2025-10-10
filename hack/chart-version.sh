#!/usr/bin/env bash

# set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <chart-name> <major|minor|patch>"
  exit 1
fi

CHART_NAME="$1"
VERSION_TYPE="$2"

if [[ -z "$CHART_NAME" || -z "$VERSION_TYPE" ]]; then
  echo "Usage: $0 <chart-name> <major|minor|patch>"
  exit 1
fi

CHART_FILE="charts/${CHART_NAME}/Chart.yaml"

if [[ ! -f "$CHART_FILE" ]]; then
  echo "Error: Chart file '$CHART_FILE' not found."
  exit 1
fi

# Lire la version actuelle
CURRENT_VERSION=$(grep -E '^version:' "$CHART_FILE" | awk '{print $2}')
if [[ -z "$CURRENT_VERSION" ]]; then
  echo "Error: version not found in $CHART_FILE"
  exit 1
else
  echo "Current version: ${CURRENT_VERSION}"
fi

# Extraire major, minor, patch
IFS='.' read -r MAJOR MINOR PATCH <<<"$CURRENT_VERSION"

case "$VERSION_TYPE" in
major)
  ((MAJOR++))
  MINOR=0
  PATCH=0
  ;;
minor)
  ((MINOR++))
  PATCH=0
  ;;
patch)
  ((PATCH++))
  ;;
*)
  echo "Error: Unknown version type '$VERSION_TYPE'. Use major, minor or patch."
  exit 1
  ;;
esac
NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"

# Remplacer la version dans le fichier
sed -i.bak "s/^version: .*/version: ${NEW_VERSION}/" "$CHART_FILE"
echo "Updated $CHART_FILE: $CURRENT_VERSION -> $NEW_VERSION"
