#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

FILES=(
    "grafana.integreatly.org_grafanaalertrulegroups.yaml"
    "grafana.integreatly.org_grafanacontactpoints.yaml"
    "grafana.integreatly.org_grafanadashboards.yaml"
    "grafana.integreatly.org_grafanadatasources.yaml"
    "grafana.integreatly.org_grafanafolders.yaml"
    "grafana.integreatly.org_grafanas.yaml"
)

VERSION=$(grep appVersion ${SCRIPT_DIR}/../Chart.yaml | awk -F" " '{ print $2 }')
echo "Grafana Operator: ${VERSION}"

REPO="https://raw.githubusercontent.com/grafana/grafana-operator/v${VERSION}/deploy/helm/grafana-operator/crds"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SED="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SED="gsed"
fi

for file in "${FILES[@]}"; do
    echo "CRD: ${file}"
    URL="${REPO}/${file}"
    if ! curl --silent --retry-all-errors --fail --location "${URL}" > "${SCRIPT_DIR}/../charts/crds/templates/${file}"; then
      echo -e "Failed to download ${URL}"
      exit 1
    fi

    # Update or insert annotations block
    if yq -e '.metadata.annotations' "${SCRIPT_DIR}/../charts/crds/templates/${file}" >/dev/null; then
      ${SED} -i '/^  annotations:$/a {{- with .Values.annotations }}\n{{- toYaml . | nindent 4 }}\n{{- end }}' "${SCRIPT_DIR}/../charts/crds/templates/${file}"
    else
      ${SED} -i '/^metadata:$/a {{- with .Values.annotations }}\n  annotations:\n{{- toYaml . | nindent 4 }}\n{{- end }}' "${SCRIPT_DIR}/../charts/crds/templates/${file}"
    fi
done
