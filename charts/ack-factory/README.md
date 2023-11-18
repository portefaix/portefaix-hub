# ack-factory

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

An AWS Factory using AWS Controllers for Kubernetes

**Homepage:** <https://github.com/portefaix/portefaix-hub/charts/ack-factory>

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Values

| Key                                                           | Type   | Default                                                   | Description                                                                                         |
| ------------------------------------------------------------- | ------ | --------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| ack.ecr[0]                                                    | object | `{"name":"charts"}`                                       | ECR repositories                                                                                    |
| ack.ecr[1].name                                               | string | `"containers"`                                            |                                                                                                     |
| ack.eks.nodegroups.core.amiType                               | string | `"AL2_x86_64"`                                            |                                                                                                     |
| ack.eks.nodegroups.core.capacityType                          | string | `"ON-DEMAND"`                                             |                                                                                                     |
| ack.eks.nodegroups.core.diskSize                              | int    | `50`                                                      |                                                                                                     |
| ack.eks.nodegroups.core.instanceTypes[0]                      | string | `"t3.large"`                                              |                                                                                                     |
| ack.eks.nodegroups.core.scalingConfig.desiredSize             | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.core.scalingConfig.maxSize                 | int    | `3`                                                       |                                                                                                     |
| ack.eks.nodegroups.core.scalingConfig.minSize                 | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.core.updateConfig.maxUnavailable           | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.core.updateConfig.maxUnavailablePercentage | int    | `50`                                                      |                                                                                                     |
| ack.eks.nodegroups.ops.amiType                                | string | `"AL2_x86_64"`                                            |                                                                                                     |
| ack.eks.nodegroups.ops.capacityType                           | string | `"SPOT"`                                                  |                                                                                                     |
| ack.eks.nodegroups.ops.diskSize                               | int    | `50`                                                      |                                                                                                     |
| ack.eks.nodegroups.ops.instanceTypes[0]                       | string | `"t3.large"`                                              |                                                                                                     |
| ack.eks.nodegroups.ops.scalingConfig.desiredSize              | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.ops.scalingConfig.maxSize                  | int    | `3`                                                       |                                                                                                     |
| ack.eks.nodegroups.ops.scalingConfig.minSize                  | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.ops.updateConfig.maxUnavailable            | int    | `1`                                                       |                                                                                                     |
| ack.eks.nodegroups.ops.updateConfig.maxUnavailablePercentage  | int    | `50`                                                      |                                                                                                     |
| ack.eks.subnet.cluster                                        | string | `"public"`                                                |                                                                                                     |
| ack.eks.subnet.node                                           | string | `"private"`                                               |                                                                                                     |
| ack.eks.version                                               | float  | `1.25`                                                    |                                                                                                     |
| ack.gateway.routes.gateway                                    | string | `"10.10.1.0/24"`                                          |                                                                                                     |
| ack.gateway.routes.natGateway                                 | string | `"10.10.2.0/24"`                                          |                                                                                                     |
| ack.gateway.subnet                                            | string | `"private"`                                               |                                                                                                     |
| ack.subnets[0].cidrBlock                                      | string | `"10.10.1.0/24"`                                          |                                                                                                     |
| ack.subnets[0].name                                           | string | `"public"`                                                |                                                                                                     |
| ack.subnets[1].cidrBlock                                      | string | `"10.10.2.0/24"`                                          |                                                                                                     |
| ack.subnets[1].name                                           | string | `"private"`                                               |                                                                                                     |
| ack.tags                                                      | list   | `[{"key":"portefaix/krm","value":"aws-controllers-k8s"}]` | AWS Tags for all resources https://aws-controllers-k8s.github.io/community/docs/user-docs/ack-tags/ |
| ack.vpc.cidr                                                  | string | `"10.10.0.0/16"`                                          |                                                                                                     |
| additionalAnnotations                                         | object | `{}`                                                      | Additional annotations to add to all resources                                                      |
| additionalLabels                                              | object | `{}`                                                      | Additional labels to add to all resources                                                           |

---

Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
