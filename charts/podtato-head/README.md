# podtato-head

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![AppVersion: 0.2.7](https://img.shields.io/badge/AppVersion-0.2.7-informational?style=flat-square)

Deploys the podtato-head app

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Values

| Key                                        | Type   | Default                  | Description                               |
| ------------------------------------------ | ------ | ------------------------ | ----------------------------------------- |
| additionalLabels                           | object | `{}`                     | Additional labels to add to all resources |
| affinity                                   | object | `{}`                     |                                           |
| autoscaling.enabled                        | bool   | `false`                  |                                           |
| autoscaling.maxReplicas                    | int    | `100`                    |                                           |
| autoscaling.minReplicas                    | int    | `1`                      |                                           |
| autoscaling.targetCPUUtilizationPercentage | int    | `80`                     |                                           |
| entry.env                                  | list   | `[]`                     |                                           |
| entry.repositoryBasename                   | string | `"entry"`                |                                           |
| entry.servicePort                          | int    | `9000`                   |                                           |
| entry.serviceType                          | string | `"LoadBalancer"`         |                                           |
| entry.tag                                  | string | `"latest"`               |                                           |
| fullnameOverride                           | string | `""`                     |                                           |
| hat.env                                    | list   | `[]`                     |                                           |
| hat.repositoryBasename                     | string | `"hat"`                  |                                           |
| hat.servicePort                            | int    | `9001`                   |                                           |
| hat.serviceType                            | string | `"ClusterIP"`            |                                           |
| hat.tag                                    | string | `"latest"`               |                                           |
| images.pullPolicy                          | string | `"IfNotPresent"`         |                                           |
| images.pullSecrets                         | list   | `[]`                     |                                           |
| images.repositoryDirname                   | string | `"ghcr.io/podtato-head"` |                                           |
| ingress.annotations                        | object | `{}`                     |                                           |
| ingress.enabled                            | bool   | `false`                  |                                           |
| ingress.hosts[0].host                      | string | `"chart-example.local"`  |                                           |
| ingress.hosts[0].paths                     | list   | `[]`                     |                                           |
| ingress.tls                                | list   | `[]`                     |                                           |
| leftArm.env                                | list   | `[]`                     |                                           |
| leftArm.repositoryBasename                 | string | `"left-arm"`             |                                           |
| leftArm.servicePort                        | int    | `9003`                   |                                           |
| leftArm.serviceType                        | string | `"ClusterIP"`            |                                           |
| leftArm.tag                                | string | `"latest"`               |                                           |
| leftLeg.env                                | list   | `[]`                     |                                           |
| leftLeg.repositoryBasename                 | string | `"left-leg"`             |                                           |
| leftLeg.servicePort                        | int    | `9002`                   |                                           |
| leftLeg.serviceType                        | string | `"ClusterIP"`            |                                           |
| leftLeg.tag                                | string | `"latest"`               |                                           |
| nameOverride                               | string | `""`                     |                                           |
| nodeSelector                               | object | `{}`                     |                                           |
| podAnnotations                             | object | `{}`                     |                                           |
| podSecurityContext                         | object | `{}`                     |                                           |
| replicaCount                               | int    | `1`                      |                                           |
| resources                                  | object | `{}`                     |                                           |
| rightArm.env                               | list   | `[]`                     |                                           |
| rightArm.repositoryBasename                | string | `"right-arm"`            |                                           |
| rightArm.servicePort                       | int    | `9005`                   |                                           |
| rightArm.serviceType                       | string | `"ClusterIP"`            |                                           |
| rightArm.tag                               | string | `"latest"`               |                                           |
| rightLeg.env                               | list   | `[]`                     |                                           |
| rightLeg.repositoryBasename                | string | `"right-leg"`            |                                           |
| rightLeg.servicePort                       | int    | `9004`                   |                                           |
| rightLeg.serviceType                       | string | `"ClusterIP"`            |                                           |
| rightLeg.tag                               | string | `"latest"`               |                                           |
| securityContext                            | object | `{}`                     |                                           |
| serviceAccount.annotations                 | object | `{}`                     |                                           |
| serviceAccount.create                      | bool   | `true`                   |                                           |
| serviceAccount.name                        | string | `""`                     |                                           |
| tolerations                                | list   | `[]`                     |                                           |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
