---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ printf "%s-%s" (include "__mixin__.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "__mixin__.namespace" . }}
  annotations:
    grafana-folder: {{ .Values.grafana.folder }}
{{ include "__mixin__.annotations" . | indent 4 }}
  labels:
    grafana-dashboard: {{ include "__mixin__.name" . }}-__name__
{{ include "__mixin__.labels" . | indent 4 }}
data:
