---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{ printf "%s-%s" (include "kube-state-metrics-mixin.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "kube-state-metrics-mixin.namespace" . }}
  annotations:
{{ include "kube-state-metrics-mixin.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
  labels:
    app: {{ include "kube-state-metrics-mixin.name" . }}
{{ include "kube-state-metrics-mixin.labels" . | indent 4 }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels | indent 4 }}
{{- end }}
spec:
