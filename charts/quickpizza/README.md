# quickpizza

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.7.0](https://img.shields.io/badge/AppVersion-0.7.0-informational?style=flat-square)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalLabels | object | `{}` | Additional labels to attach to all resources |
| affinity | object | `{}` | Pod affinity |
| catalog.replicas | int | `1` | Number of replicas for the Catalog component |
| catalog.resources | object | `{}` | Catalog resource requests and limits |
| config.replicas | int | `1` | Number of replicas for the Config component |
| config.resources | object | `{}` | Config resource requests and limits |
| copy.replicas | int | `1` | Number of replicas for the Copy component |
| copy.resources | object | `{}` | Copy resource requests and limits |
| frontend.replicas | int | `1` | Number of replicas for the Frontend component |
| frontend.resources | object | `{}` | Frontend resource requests and limits |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/grafana/quickpizza-local"` | Docker repository |
| image.tag | string | `""` | Docker image tag. |
| ingress.enabled | bool | `false` |  |
| nodeSelector | object | `{}` | Node labels for Prometheus server pod assignment |
| pizza.faro | string | `""` |  |
| pizza.logLevel | string | `"debug"` |  |
| pizza.otlp | string | `""` |  |
| recs.replicas | int | `1` | Number of replicas for the Recs component |
| recs.resources | object | `{}` | Recs resource requests and limits |
| service.port | int | `3333` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.additionalLabels."prometheus.io/operator" | string | `"portefaix"` |  |
| serviceMonitor.enabled | bool | `true` |  |
| tolerations | list | `[]` | Node tolerations for server scheduling to nodes with taints |
| ws.replicas | int | `1` | Number of replicas for the WS component |
| ws.resources | object | `{}` | WS resource requests and limits |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)