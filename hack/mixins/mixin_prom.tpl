---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{ printf "%s-%s" (include "__mixin__.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "__mixin__.namespace" . }}
  annotations:
{{ include "__mixin__.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
  labels:
    app: {{ include "__mixin__.name" . }}
{{ include "__mixin__.labels" . | indent 4 }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels | indent 4 }}
{{- end }}
spec:
