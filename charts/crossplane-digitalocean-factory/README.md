# crossplane-digitalocean-factory

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Google Cloud Factory using Crossplane

**Homepage:** <https://github.com/portefaix/portefaix-hub/charts/crossplane-digitalocean-factory>

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Values

| Key                                         | Type   | Default                                                                                          | Description                                                                            |
| ------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| additionalAnnotations                       | object | `{}`                                                                                             | Additional annotations to add to all resources                                         |
| additionalLabels                            | object | `{}`                                                                                             | Additional labels to add to all resources                                              |
| crossplane.digitalocean.version             | string | `"v0.2.0"`                                                                                       | The Crossplane DigitalOcean provider version                                           |
| crossplane.namespace                        | string | `"crossplane-system"`                                                                            | Namespace which contains the Crossplane controller                                     |
| crossplane.version                          | string | `"v1.9.1"`                                                                                       | The Crossplane controller version                                                      |
| digitalocean.doks.autoUpgrade               | bool   | `true`                                                                                           | Enable/disable the cluster upgrade to new patch releases during its maintenance window |
| digitalocean.doks.highlyAvailable           | bool   | `false`                                                                                          | Enable/disable the high availability control plane for a cluster.                      |
| digitalocean.doks.maintenancePolicy         | object | `{"day":"wednesday","startTime":"00:00"}`                                                        | The cluster's maintenance window                                                       |
| digitalocean.doks.nodePools                 | list   | `[{"count":2,"name":"core","size":"s-1vcpu-2gb"},{"count":1,"name":"ops","size":"s-1vcpu-2gb"}]` | A DigitalOcean Kubernetes node pool resource                                           |
| digitalocean.doks.region                    | string | `"nyc1"`                                                                                         | The slug identifier for the region where the Kubernetes cluster will be created        |
| digitalocean.doks.surgeUpgrade              | bool   | `false`                                                                                          | Enable/disable surge upgrades for a cluster                                            |
| digitalocean.doks.version                   | string | `"1.24.4-do.0"`                                                                                  | The slug identifier for the version of Kubernetes                                      |
| digitalocean.registries[0].name             | string | `"charts"`                                                                                       |                                                                                        |
| digitalocean.registries[0].region           | string | `"nyc1"`                                                                                         |                                                                                        |
| digitalocean.registries[0].subscriptionTier | string | `"starter"`                                                                                      |                                                                                        |
| digitalocean.registries[1].name             | string | `"foo"`                                                                                          |                                                                                        |
| digitalocean.registries[1].region           | string | `"nyc1"`                                                                                         |                                                                                        |
| digitalocean.registries[1].subscriptionTier | string | `"starter"`                                                                                      |                                                                                        |

---

Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
