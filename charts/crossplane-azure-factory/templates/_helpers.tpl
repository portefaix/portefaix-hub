{{/*
Expand the name of the chart.
*/}}
{{- define "crossplane-azure-factory.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "crossplane-azure-factory.fullname" -}}
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
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "crossplane-azure-factory.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "crossplane-azure-factory.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "crossplane-azure-factory.labels" -}}
helm.sh/chart: {{ include "crossplane-azure-factory.chart" . }}
{{ include "crossplane-azure-factory.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: crossplane-factory
app.kubernetes.io/part-of: {{ include "crossplane-azure-factory.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
crossplane.io/version: {{ .Values.crossplane.version }}
crossplane.io/provider: azure-{{ .Values.crossplane.azure.version }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "crossplane-azure-factory.selectorLabels" -}}
app.kubernetes.io/name: {{ include "crossplane-azure-factory.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Azure tags object
*/}}
{{- define "crossplane-azure-factory.azureTagsObj" -}}
Controller: krm
Made-by: crossplane
{{- end }}

{{/*
Azure labels object
*/}}
{{- define "crossplane-azure-factory.azureLabelsObj" -}}
Controller: krm
Made-by: crossplane
{{- end }}

