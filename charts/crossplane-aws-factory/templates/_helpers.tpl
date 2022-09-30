{{/*
Expand the name of the chart.
*/}}
{{- define "crossplane-aws-factory.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "crossplane-aws-factory.fullname" -}}
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
{{- define "crossplane-aws-factory.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "crossplane-aws-factory.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "crossplane-aws-factory.labels" -}}
helm.sh/chart: {{ include "crossplane-aws-factory.chart" . }}
{{ include "crossplane-aws-factory.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: crossplane-factory
app.kubernetes.io/part-of: {{ include "crossplane-aws-factory.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
crossplane.io/version: {{ .Values.crossplane.version }}
crossplane.io/provider: aws-{{ .Values.crossplane.aws.version }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "crossplane-aws-factory.selectorLabels" -}}
app.kubernetes.io/name: {{ include "crossplane-aws-factory.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
AWS tags
*/}}
{{- define "crossplane-aws-factory.awsTags" -}}
- key: Controller
  value: krm
- key: Made-by
  value: crossplane
{{- end }}

{{/*
AWS tags object
*/}}
{{- define "crossplane-aws-factory.awsTagsObj" -}}
Controller: krm
Made-by: crossplane
{{- end }}
