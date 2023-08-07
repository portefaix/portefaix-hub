{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "alertmanager-mixin.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "alertmanager-mixin.fullname" -}}
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
{{- define "alertmanager-mixin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "alertmanager-mixin.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alertmanager-mixin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "alertmanager-mixin.labels" }}
helm.sh/chart: {{ include "alertmanager-mixin.chart" . }}
{{ include "alertmanager-mixin.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: monitoring-mixin
app.kubernetes.io/part-of: {{ include "alertmanager-mixin.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ if .Values.additionalLabels -}}
{{ toYaml .Values.additionalLabels -}}
{{ end -}}
{{- end }}

{{/* See: https://ambassadorlabs.github.io/k8s-for-humans/ */}}
{{/*
Common annotations
*/}}
{{- define "alertmanager-mixin.annotations" }}
a8r.io/description: Monitoring Mixin for alertmanager
a8r.io/owner: portefaix
a8r.io/bugs: https://github.com/portefaix/portefaix-hub/issues
a8r.io/documentation: https://artifacthub.io/packages/helm/portefaix-hub/alertmanager-mixin
a8r.io/repository: https://github.com/portefaix/portefaix-hub
a8r.io/support: https://github.com/portefaix/portefaix-hub/issues
{{ if .Values.additionalAnnotations -}}
{{ toYaml .Values.additionalAnnotations -}}
{{ end -}}
{{- end }}

{{/* a8r.io/logs: */}}
{{/* a8r.io/runbook: */}}
{{/* a8r.io/incidents:  */}}
{{/* a8r.io/uptime */}}
{{/* a8r.io/performance */}}
{{/* a8r.io/dependencies */}}

{{/*
Allow the release namespace to be overridden
*/}}
{{- define "alertmanager-mixin.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}
