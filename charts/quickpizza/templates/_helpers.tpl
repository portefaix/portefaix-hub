{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "quickpizza.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "quickpizza.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "quickpizza.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "quickpizza.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "quickpizza.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "quickpizza.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "quickpizza.labels" }}
helm.sh/chart: {{ include "quickpizza.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ template "quickpizza.name" . }}
{{- include "quickpizza.selectorLabels" . }}
{{- if .Chart.Version }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
{{- end }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "quickpizza.selectorLabels" }}
app.kubernetes.io/name: {{ include "quickpizza.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "quickpizza.frontend.labels" -}}
app.kubernetes.io/component: frontend-gateway
{{- end -}}

{{- define "quickpizza.config.labels" -}}
app.kubernetes.io/component: config
{{- end -}}

{{- define "quickpizza.ws.labels" -}}
app.kubernetes.io/component: ws
{{- end -}}

{{- define "quickpizza.catalog.labels" -}}
app.kubernetes.io/component: catalog
{{- end -}}

{{- define "quickpizza.copy.labels" -}}
app.kubernetes.io/component: copy
{{- end -}}

{{- define "quickpizza.recs.labels" -}}
app.kubernetes.io/component: recs
{{- end -}}