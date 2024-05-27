{{ if .Values.monitor.enabled -}}
---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{ printf "%s-%s" (include "__mixin__.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "__mixin__.namespace" . }}
  annotations:
    {{- include "__mixin__.annotations" . | indent 4 }}
  labels:
    {{- include "__mixin__.labels" . | indent 4 }}
    app.kubernetes.io/component: metrics
    {{- if .Values.monitor.additionalLabels }}
    {{- toYaml .Values.monitor.additionalLabels | nindent 4 }}
    {{- end }}
spec:
