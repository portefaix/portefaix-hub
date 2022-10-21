{{/*
Expand the name of the chart.
*/}}
{{- define "crossplane-exoscale-factory.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "crossplane-exoscale-factory.fullname" -}}
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
{{- define "crossplane-exoscale-factory.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "crossplane-exoscale-factory.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "crossplane-exoscale-factory.labels" -}}
helm.sh/chart: {{ include "crossplane-exoscale-factory.chart" . }}
{{ include "crossplane-exoscale-factory.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: crossplane-factory
app.kubernetes.io/part-of: {{ include "crossplane-exoscale-factory.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
crossplane.io/version: {{ .Values.crossplane.version }}
crossplane.io/provider: exoscale-{{ .Values.crossplane.exoscale.version }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "crossplane-exoscale-factory.selectorLabels" -}}
app.kubernetes.io/name: {{ include "crossplane-exoscale-factory.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
GCP labels object
*/}}
{{- define "crossplane-exoscale-factory.exoscaleLabelsObj" -}}
Controller: krm
Made-by: crossplane
{{- end }}
