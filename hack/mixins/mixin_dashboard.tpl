---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ printf "%s-%s" (include "__mixin__.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "__mixin__.namespace" . }}
  annotations:
{{ include "__mixin__.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
    grafana/folder: {{ .Values.grafana.folder }}
  labels:
{{ include "__mixin__.labels" . | indent 4 }}
    grafana/dashboard: {{ include "__mixin__.name" . }}-__name__
data:
