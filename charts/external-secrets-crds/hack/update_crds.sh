#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

FILES=(
    "acraccesstokens.generators.external-secrets.io.yaml"
    "clusterexternalsecrets.external-secrets.io.yaml"
    "clustersecretstores.external-secrets.io.yaml"
    "ecrauthorizationtokens.generators.external-secrets.io.yaml"
    "externalsecrets.external-secrets.io.yaml"
    "fakes.generators.external-secrets.io.yaml"
    "gcraccesstokens.generators.external-secrets.io.yaml"
    "githubaccesstokens.generators.external-secrets.io.yaml"
    "passwords.generators.external-secrets.io.yaml"
    "pushsecrets.external-secrets.io.yaml"
    "secretstores.external-secrets.io.yaml"
    "uuids.generators.external-secrets.io.yaml"
    "vaultdynamicsecrets.generators.external-secrets.io.yaml"
    "webhooks.generators.external-secrets.io.yaml"
)

VERSION=$(grep appVersion ${SCRIPT_DIR}/../Chart.yaml | awk -F" " '{ print $2 }')
echo "External Secrets: ${VERSION}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SED="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SED="gsed"
fi

# Download the bundle file and create CRD files
URL="https://raw.githubusercontent.com/external-secrets/external-secrets/v${VERSION}/deploy/crds/bundle.yaml"
if ! curl --silent --retry-all-errors --fail --location "${URL}" > "${SCRIPT_DIR}/../charts/crds/bundle.yaml"; then
  echo -e "Failed to download ${URL}"
  exit 1
fi
kubectl slice -f "${SCRIPT_DIR}/../charts/crds/bundle.yaml" -t "{{.metadata.name}}.yaml" -o "${SCRIPT_DIR}/../charts/crds/templates/"
rm "${SCRIPT_DIR}/../charts/crds/bundle.yaml"


for file in "${FILES[@]}"; do
    echo "CRD: ${file}"
    # URL="https://raw.githubusercontent.com/external-secrets/external-secrets/v${VERSION}/deploy/crds/${file}"
    # if ! curl --silent --retry-all-errors --fail --location "${URL}" > "${SCRIPT_DIR}/../charts/crds/${file}"; then
    #   echo -e "Failed to download ${URL}"
    #   exit 1
    # fi

    # Update or insert annotations block
    if yq -e '.metadata.annotations' "${SCRIPT_DIR}/../charts/crds/templates/${file}" >/dev/null; then
      ${SED} -i '/^  annotations:$/a {{- with .Values.annotations }}\n{{- toYaml . | nindent 4 }}\n{{- end }}' "${SCRIPT_DIR}/../charts/crds/templates/${file}"
    else
      ${SED} -i '/^metadata:$/a {{- with .Values.annotations }}\n  annotations:\n{{- toYaml . | nindent 4 }}\n{{- end }}' "${SCRIPT_DIR}/../charts/crds/templates/${file}"
    fi
done
