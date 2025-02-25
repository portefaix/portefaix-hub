# beyla

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.2.0](https://img.shields.io/badge/AppVersion-1.2.0-informational?style=flat-square)

Beyla

**Homepage:** <https://github.com/grafana/beyla>

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Source Code

- <https://github.com/grafana/beyla>

## Values

| Key                                       | Type   | Default                                                                                       | Description                                                                                          |
| ----------------------------------------- | ------ | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| additionalAnnotations                     | object | `{}`                                                                                          | Additional annotations to add to all resources                                                       |
| additionalLabels                          | object | `{}`                                                                                          | Additional labels to add to all resources                                                            |
| beyla.config.attributes.kubernetes.enable | bool   | `true`                                                                                        |                                                                                                      |
| beyla.config.internal_metrics.path        | string | `"/internal/metrics"`                                                                         |                                                                                                      |
| beyla.config.internal_metrics.port        | int    | `9090`                                                                                        |                                                                                                      |
| beyla.config.log_level                    | string | `"debug"`                                                                                     |                                                                                                      |
| beyla.config.print_traces                 | bool   | `true`                                                                                        |                                                                                                      |
| beyla.config.prometheus_export.path       | string | `"/metrics"`                                                                                  |                                                                                                      |
| beyla.config.prometheus_export.port       | int    | `9090`                                                                                        |                                                                                                      |
| beyla.config.routes.unmatched             | string | `"heuristic"`                                                                                 |                                                                                                      |
| beyla.existingConfig                      | string | `""`                                                                                          | Specify an existing configMap containing Beyla configuration. If non-empty, overrides `beyla.config` |
| image                                     | object | `{"pullPolicy":"IfNotPresent","pullSecrets":null,"repository":"grafana/beyla","tag":"1.2.0"}` | Docker image                                                                                         |
| rbac.create                               | bool   | `true`                                                                                        | Specifies whether RBAC resources should be created                                                   |
| resources                                 | object | `{}`                                                                                          | Container resources: requests and limits for CPU, Memory                                             |
| service.port                              | int    | `9090`                                                                                        |                                                                                                      |
| service.type                              | string | `"ClusterIP"`                                                                                 |                                                                                                      |
| serviceAccount.create                     | bool   | `true`                                                                                        | Specifies whether a ServiceAccount should be created                                                 |
| serviceAccount.name                       | string | `nil`                                                                                         |                                                                                                      |
| serviceMonitor.additionalLabels           | object | `{}`                                                                                          | Add custom labels to the ServiceMonitor resource                                                     |
| serviceMonitor.enabled                    | bool   | `true`                                                                                        | Enable this if you're using https://github.com/coreos/prometheus-operator                            |
| serviceMonitor.honorLabels                | bool   | `false`                                                                                       |                                                                                                      |
| serviceMonitor.interval                   | string | `"30s"`                                                                                       | Fallback to the prometheus default unless specified                                                  |
| serviceMonitor.namespace                  | string | `""`                                                                                          | Namespace to deploy the ServiceMonitor                                                               |
| serviceMonitor.path                       | string | `"/metrics"`                                                                                  | Path to scrape metrics                                                                               |
| serviceMonitor.scrapeTimeout              | string | `"10s"`                                                                                       | Timeout for scrape metrics request                                                                   |

---

Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
