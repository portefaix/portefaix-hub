# speedtest-exporter

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.4](https://img.shields.io/badge/AppVersion-0.0.4-informational?style=flat-square)

A Helm chart for Prometheus Speedtest exporter

**Homepage:** <https://charts.portefaix.xyz>

## Maintainers

| Name       | Email                         | Url |
| ---------- | ----------------------------- | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |     |

## Source Code

- <https://github.com/nlamirault/portefaix-hub/tree/master/charts/speedtest-exporter>

## Values

| Key                             | Type   | Default                           | Description                                                  |
| ------------------------------- | ------ | --------------------------------- | ------------------------------------------------------------ |
| additionalAnnotations           | object | `{}`                              | Additional annotations to add to the Prometheus rules        |
| additionalLabels                | object | `{}`                              | Additional labels to add to the Prometheus rules             |
| affinity                        | object | `{}`                              |                                                              |
| fullnameOverride                | string | `""`                              | Provide a name to substitute for the full names of resources |
| hostNetwork                     | bool   | `false`                           |                                                              |
| image.pullPolicy                | string | `"IfNotPresent"`                  |                                                              |
| image.pullSecret                | string | `""`                              |                                                              |
| image.repository                | string | `"danopstech/speedtest_exporter"` |                                                              |
| image.tag                       | string | `"v0.0.5"`                        |                                                              |
| imagePullSecrets                | list   | `[]`                              |                                                              |
| nodeSelector                    | object | `{}`                              |                                                              |
| podAnnotations                  | object | `{}`                              |                                                              |
| readOnlyRootFilesystem          | bool   | `true`                            |                                                              |
| replicas                        | int    | `1`                               |                                                              |
| resources                       | object | `{}`                              |                                                              |
| runAsNonRoot                    | bool   | `true`                            |                                                              |
| runAsUser                       | int    | `1000`                            |                                                              |
| securityContext.enabled         | bool   | `true`                            |                                                              |
| securityContext.runAsGroup      | int    | `65534`                           |                                                              |
| securityContext.runAsUser       | int    | `65534`                           |                                                              |
| service.annotations             | object | `{}`                              |                                                              |
| service.loadBalancerIP          | string | `""`                              |                                                              |
| service.nodePort                | int    | `0`                               |                                                              |
| service.port                    | int    | `9090`                            |                                                              |
| service.type                    | string | `"ClusterIP"`                     |                                                              |
| serviceAccount.annotations      | object | `{}`                              |                                                              |
| serviceAccount.create           | bool   | `true`                            |                                                              |
| serviceAccount.imagePullSecrets | list   | `[]`                              |                                                              |
| serviceAccount.name             | string | `nil`                             |                                                              |
| serviceMonitor.enabled          | bool   | `false`                           |                                                              |
| tolerations                     | list   | `[]`                              |                                                              |

---

Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
