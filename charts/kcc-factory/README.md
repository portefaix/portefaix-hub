# kcc-factory

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A GCP Factory using Kubernetes Config Connector

**Homepage:** <https://github.com/portefaix/portefaix-hub/charts/kcc-factory>

## Maintainers

| Name       | Email                         | Url                             |
| ---------- | ----------------------------- | ------------------------------- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Values

| Key                                                              | Type   | Default                    | Description                                    |
| ---------------------------------------------------------------- | ------ | -------------------------- | ---------------------------------------------- |
| additionalAnnotations                                            | object | `{}`                       | Additional annotations to add to all resources |
| additionalLabels                                                 | object | `{}`                       | Additional labels to add to all resources      |
| kcc.artifactregistry[0].format                                   | string | `"DOCKER"`                 |                                                |
| kcc.artifactregistry[0].location                                 | string | `"eu-west1"`               |                                                |
| kcc.artifactregistry[0].name                                     | string | `"charts"`                 |                                                |
| kcc.artifactregistry[1].format                                   | string | `"DOCKER"`                 |                                                |
| kcc.artifactregistry[1].location                                 | string | `"eu-west1"`               |                                                |
| kcc.artifactregistry[1].name                                     | string | `"containers"`             |                                                |
| kcc.buckets[0].lifecycleRule[0].action.type                      | string | `"Delete"`                 |                                                |
| kcc.buckets[0].lifecycleRule[0].condition.age                    | int    | `10`                       |                                                |
| kcc.buckets[0].location                                          | string | `"eu-west1"`               |                                                |
| kcc.buckets[0].name                                              | string | `"logs"`                   |                                                |
| kcc.buckets[0].storageClass                                      | string | `"standard"`               |                                                |
| kcc.buckets[0].versioning                                        | bool   | `true`                     |                                                |
| kcc.gke.clusterAutoscaling.autoscalingProfile                    | string | `"BALANCED"`               |                                                |
| kcc.gke.clusterAutoscaling.enabled                               | bool   | `true`                     |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[0].maximum             | int    | `100`                      |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[0].minimum             | int    | `10`                       |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[0].resourceType        | string | `"cpu"`                    |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[1].maximum             | int    | `1000`                     |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[1].minimum             | int    | `100`                      |                                                |
| kcc.gke.clusterAutoscaling.resourceLimits[1].resourceType        | string | `"memory"`                 |                                                |
| kcc.gke.datapathProvider                                         | string | `"ADVANCED_DATAPATH"`      |                                                |
| kcc.gke.defaultNodepools.defaultMaxPodsPerNode                   | int    | `16`                       |                                                |
| kcc.gke.defaultNodepools.initialNodeCount                        | int    | `0`                        |                                                |
| kcc.gke.defaultNodepools.nodeLocations[0]                        | string | `"eu-west1-a"`             |                                                |
| kcc.gke.defaultNodepools.nodeLocations[1]                        | string | `"eu-west1-b"`             |                                                |
| kcc.gke.defaultNodepools.nodeLocations[2]                        | string | `"eu-west1-c"`             |                                                |
| kcc.gke.ipAllocationPolicy.clusterSecondaryRangeName             | string | `"pods"`                   |                                                |
| kcc.gke.ipAllocationPolicy.servicesSecondaryRangeName            | string | `"services"`               |                                                |
| kcc.gke.location                                                 | string | `"eu-west1"`               |                                                |
| kcc.gke.maintenancePolicy.dailyMaintenanceWindow.startTime       | string | `"03:00"`                  |                                                |
| kcc.gke.masterAuthorizedNetworksConfig.cidrBlocks[0].cidrBlock   | string | `"0.0.0.0/0"`              |                                                |
| kcc.gke.masterAuthorizedNetworksConfig.cidrBlocks[0].displayName | string | `"The Internet"`           |                                                |
| kcc.gke.networkPolicy.enabled                                    | bool   | `true`                     |                                                |
| kcc.gke.networkingMode                                           | string | `"VPC_NATIVE"`             |                                                |
| kcc.gke.nodepools[0].autoscaling.maxNodeCount                    | int    | `3`                        |                                                |
| kcc.gke.nodepools[0].autoscaling.minNodeCount                    | int    | `1`                        |                                                |
| kcc.gke.nodepools[0].diskSizeGb                                  | int    | `100`                      |                                                |
| kcc.gke.nodepools[0].diskType                                    | string | `"pd-ssd"`                 |                                                |
| kcc.gke.nodepools[0].machineType                                 | string | `"e2-standard-16"`         |                                                |
| kcc.gke.nodepools[0].name                                        | string | `"core"`                   |                                                |
| kcc.gke.nodepools[0].preemptible                                 | bool   | `false`                    |                                                |
| kcc.gke.nodepools[1].autoscaling.maxNodeCount                    | int    | `3`                        |                                                |
| kcc.gke.nodepools[1].autoscaling.minNodeCount                    | int    | `1`                        |                                                |
| kcc.gke.nodepools[1].diskSizeGb                                  | int    | `100`                      |                                                |
| kcc.gke.nodepools[1].diskType                                    | string | `"pd-ssd"`                 |                                                |
| kcc.gke.nodepools[1].machineType                                 | string | `"e2-standard-16"`         |                                                |
| kcc.gke.nodepools[1].name                                        | string | `"ops"`                    |                                                |
| kcc.gke.nodepools[1].preemptible                                 | bool   | `true`                     |                                                |
| kcc.gke.notificationConfig.pubsub.enabled                        | bool   | `true`                     |                                                |
| kcc.gke.notificationConfig.pubsub.topicRef.name                  | string | `"kcc-factory-gke-update"` |                                                |
| kcc.gke.releaseChannel                                           | string | `"REGULAR"`                |                                                |
| kcc.gke.verticalPodAutoscaling.enabled                           | bool   | `false`                    |                                                |
| kcc.network.ipCidrRange                                          | string | `"10.2.0.0/16"`            |                                                |
| kcc.network.region                                               | string | `"eu-west1"`               |                                                |
| kcc.network.routingMode                                          | string | `"REGIONAL"`               |                                                |
| kcc.network.secondaryIpRange[0].ipCidrRange                      | string | `"10.3.0.0/16"`            |                                                |
| kcc.network.secondaryIpRange[0].rangeName                        | string | `"services"`               |                                                |
| kcc.network.secondaryIpRange[1].ipCidrRange                      | string | `"10.4.0.0/16"`            |                                                |
| kcc.network.secondaryIpRange[1].rangeName                        | string | `"pods"`                   |                                                |
| kcc.pubsub.topics[0].name                                        | string | `"gke-update"`             |                                                |

---

Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
