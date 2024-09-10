#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

FILES=(
    "aquasecurity.github.io_clustercompliancereports.yaml"
    "aquasecurity.github.io_clusterconfigauditreports.yaml"
    "aquasecurity.github.io_clusterinfraassessmentreports.yaml"
    "aquasecurity.github.io_clusterrbacassessmentreports.yaml"
    "aquasecurity.github.io_clustersbomreports.yaml"
    "aquasecurity.github.io_clustervulnerabilityreports.yaml"
    "aquasecurity.github.io_configauditreports.yaml"
    "aquasecurity.github.io_exposedsecretreports.yaml"
    "aquasecurity.github.io_infraassessmentreports.yaml"
    "aquasecurity.github.io_rbacassessmentreports.yaml"
    "aquasecurity.github.io_sbomreports.yaml"
    "aquasecurity.github.io_vulnerabilityreports.yaml"
)

VERSION=$(grep appVersion ${SCRIPT_DIR}/../Chart.yaml | awk -F" " '{ print $2 }')
echo "Trivy Operator: ${VERSION}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SED="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SED="gsed"
fi

for file in "${FILES[@]}"; do
    echo "CRD: ${file}"
    URL="https://raw.githubusercontent.com/aquasecurity/trivy-operator/${VERSION}/deploy/helm/crds/${file}"
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
