# cloudflare-tunnel

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2024.8.3](https://img.shields.io/badge/AppVersion-2024.8.3-informational?style=flat-square)

Creation of a cloudflared deployment - a reverse tunnel for an environment

**Homepage:** <https://github.com/nlamirault/portefaix-hub>

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Source Code

- <https://github.com/nlamirault/portefaix-hub/tree/master/charts/cloudflare-tunnel>

## Values

| Key                                      | Type   | Default                    | Description                                                               |
| ---------------------------------------- | ------ | -------------------------- | ------------------------------------------------------------------------- |
| additionalLabels                         | object | `{}`                       | Additional labels to add to all resources                                 |
| affinity                                 | object | `{}`                       |                                                                           |
| cloudflare.account                       | string | `""`                       |                                                                           |
| cloudflare.enableWarp                    | bool   | `false`                    |                                                                           |
| cloudflare.ingress                       | list   | `[]`                       |                                                                           |
| cloudflare.protocol                      | string | `""`                       |                                                                           |
| cloudflare.secret                        | string | `""`                       |                                                                           |
| cloudflare.secretName                    | string | `nil`                      |                                                                           |
| cloudflare.tunnelId                      | string | `""`                       |                                                                           |
| cloudflare.tunnelName                    | string | `""`                       |                                                                           |
| fullnameOverride                         | string | `""`                       |                                                                           |
| image.pullPolicy                         | string | `"IfNotPresent"`           |                                                                           |
| image.repository                         | string | `"cloudflare/cloudflared"` |                                                                           |
| image.tag                                | string | `"2024.8.3"`               |                                                                           |
| imagePullSecrets                         | list   | `[]`                       |                                                                           |
| metrics.port                             | int    | `2000`                     | The port on which to expose the metrics and ready endpoints               |
| nameOverride                             | string | `""`                       |                                                                           |
| nodeSelector                             | object | `{}`                       |                                                                           |
| podAnnotations                           | object | `{}`                       |                                                                           |
| podSecurityContext.runAsNonRoot          | bool   | `true`                     |                                                                           |
| podSecurityContext.runAsUser             | int    | `65532`                    |                                                                           |
| replicaCount                             | int    | `1`                        |                                                                           |
| resources                                | object | `{}`                       |                                                                           |
| securityContext.allowPrivilegeEscalation | bool   | `false`                    |                                                                           |
| securityContext.capabilities.drop[0]     | string | `"ALL"`                    |                                                                           |
| securityContext.readOnlyRootFilesystem   | bool   | `true`                     |                                                                           |
| serviceAccount.annotations               | object | `{}`                       |                                                                           |
| serviceAccount.name                      | string | `""`                       |                                                                           |
| serviceMonitor.additionalLabels          | object | `{}`                       | Add custom labels to the ServiceMonitor resource                          |
| serviceMonitor.enabled                   | bool   | `false`                    | Enable this if you're using https://github.com/coreos/prometheus-operator |
| serviceMonitor.honorLabels               | bool   | `false`                    | Chooses the metric’s labels on collisions with target labels.             |
| serviceMonitor.interval                  | string | `"30s"`                    | Interval at which endpoints should be scraped.                            |
| serviceMonitor.path                      | string | `"/metrics"`               | Path to scrape metrics                                                    |
| serviceMonitor.scrapeTimeout             | string | `"10s"`                    | Timeout for scrape metrics request                                        |
| tolerations                              | list   | `[]`                       |                                                                           |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
