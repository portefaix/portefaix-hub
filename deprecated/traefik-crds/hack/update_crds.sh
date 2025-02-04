#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

FILES=(
    "traefik.io_ingressroutes.yaml"
    "traefik.io_ingressroutetcps.yaml"
    "traefik.io_ingressrouteudps.yaml"
    "traefik.io_middlewares.yaml"
    "traefik.io_middlewaretcps.yaml"
    "traefik.io_serverstransports.yaml"
    "traefik.io_serverstransporttcps.yaml"
    "traefik.io_tlsoptions.yaml"
    "traefik.io_tlsstores.yaml"
    "traefik.io_traefikservices.yaml"
)

VERSION=$(grep appVersion ${SCRIPT_DIR}/../Chart.yaml | awk -F" " '{ print $2 }')
echo "Traefik: ${VERSION}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SED="sed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SED="gsed"
fi

for file in "${FILES[@]}"; do
    echo "CRD: ${file}"
    URL="https://raw.githubusercontent.com/traefik/traefik-helm-chart/${VERSION}/traefik/crds/${file}"
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
