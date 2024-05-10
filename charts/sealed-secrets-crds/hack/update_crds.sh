#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

FILES=(
    "bitnami.com_sealedsecrets.yaml"
)

VERSION=$(grep appVersion ${SCRIPT_DIR}/../Chart.yaml | awk -F" " '{ print $2 }')
echo "Gateway API: ${VERSION}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SED="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SED="gsed"
fi

for file in "${FILES[@]}"; do
    echo "CRD: ${file}"
    # URL="https://raw.githubusercontent.com/bitnami-labs/sealed-secrets/helm-v${VERSION}/helm/sealed-secrets/crds/${file}"
    URL="https://raw.githubusercontent.com/bitnami-labs/sealed-secrets/v${VERSION}/helm/sealed-secrets/crds/${file}"
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
