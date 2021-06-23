{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Allow the release namespace to be overridden
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "secrets-store-csi-driver-provider-gcp.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.labels" }}
helm.sh/chart: {{ include "secrets-store-csi-driver-provider-gcp.chart" . }}
app.kubernetes.io/component: secrets-store-csi-driver
app.kubernetes.io/part-of: {{ include "secrets-store-csi-driver-provider-gcp.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- include "secrets-store-csi-driver-provider-gcp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "secrets-store-csi-driver-provider-gcp.selectorLabels" }}
app.kubernetes.io/name: {{ include "secrets-store-csi-driver-provider-gcp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}