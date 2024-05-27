---
{{- $files := .Files.Glob "dashboards/*.json" }}
{{- if $files }}
apiVersion: v1
kind: ConfigMapList
items:
{{- range $path, $fileContents := $files }}
{{- $dashboardName := regexReplaceAll "(^.*/)(.*)\\.json$" $path "${2}" }}
- apiVersion: v1
  kind: ConfigMap
  metadata:
    name: {{ printf "dashboard-__mixin__-%s" $dashboardName | trunc 63 | trimSuffix "-" }}
    namespace: {{ include "__mixin__.namespace" $ }}
    annotations:
      grafana-folder: {{ $.Values.grafana.folder }}
      {{- include "__mixin__.annotations" $ | indent 6 }}
    labels:
      grafana-dashboard: {{ $dashboardName }}
      {{- include "__mixin__.labels" $ | indent 6 }}
      app.kubernetes.io/component: dashboards
  data:
    {{ $dashboardName }}.json: |-
{{ $.Files.Get $path | indent 6}}
{{- end }}
{{ if $.Values.grafanaDashboard.grafanaOperator.enabled -}}
{{- range $path, $fileContents := $files }}
{{- $dashboardName := regexReplaceAll "(^.*/)(.*)\\.json$" $path "${2}" }}
---
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDashboard
metadata:
  labels:
    {{- include "__mixin__-mixin.labels" $ | indent 4 }}
  name: {{ printf "__mixin__-%s" $dashboardName | trunc 63 | trimSuffix "-" | lower }}
  namespace: {{ $.Release.Namespace }}
spec:
  allowCrossNamespaceImport: {{ $.Values.grafanaDashboard.grafanaOperator.allowCrossNamespaceImport }}
  folder: {{ $.Values.grafanaDashboard.folder }}
  instanceSelector:
    matchLabels:
      {{- toYaml $.Values.grafanaDashboard.grafanaOperator.matchLabels | nindent 6 }}
  configMapRef:
    name: {{ printf "dashboard-__mixin__-%s" $dashboardName | trunc 63 | trimSuffix "-" }}
    key: {{ $dashboardName }}.json
{{- end }}
{{- end }}
{{- end }}
{{- end }}
