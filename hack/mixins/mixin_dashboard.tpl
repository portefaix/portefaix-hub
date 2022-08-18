---
{{- $files := .Files.Glob "dashboards/*.json" }}
{{- if $files }}
{{- range $path, $fileContents := $files }}
{{- $dashboardName := regexReplaceAll "(^.*/)(.*)\\.json$" $path "${2}" }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ printf "dashboard-__mixin__-%s" $dashboardName | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "__mixin__.namespace" $ }}
  annotations:
    grafana-folder: {{ $.Values.grafana.folder }}
    {{- include "__mixin__.annotations" $ | indent 4 }}
  labels:
    grafana-dashboard: {{ $dashboardName }}
    {{- include "__mixin__.labels" $ | indent 4 }}
data:
  {{ $dashboardName }}.json: |-
{{ $.Files.Get $path | indent 4}}
{{- end }}
{{- end }}
