# crossplane-gcp-factory

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.0](https://img.shields.io/badge/AppVersion-1.5.0-informational?style=flat-square)

A Google Cloud Factory using Crossplane

**Homepage:** <https://github.com/portefaix/portefaix-hub/charts/crossplane-gcp-factory>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | nicolas.lamirault@gmail.com | https://github.com/nlamirault |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional annotations to add to all resources |
| additionalLabels | object | `{"crossplane.io/provider":"gcp-v0.19.0","crossplane.io/version":"v0.15.0"}` | Additional labels to add to all resources |
| crossplane.gcp.version | string | `"v0.19.0"` | The Crossplane GCP provider version |
| crossplane.namespace | string | `"crossplane-system"` | Namespace which contains the Crossplane controller |
| gcp.buckets[0].location | string | `"EU"` |  |
| gcp.buckets[0].name | string | `"charts"` |  |
| gcp.buckets[0].service | string | `"Helm"` |  |
| gcp.buckets[0].storageClass | string | `"REGIONAL"` |  |
| gcp.buckets[1].location | string | `"EU"` |  |
| gcp.buckets[1].name | string | `"thanos"` |  |
| gcp.buckets[1].service | string | `"Thanos"` |  |
| gcp.buckets[1].storageClass | string | `"REGIONAL"` |  |
| gcp.buckets_policies[0].admins[0] | string | `"thanos"` |  |
| gcp.buckets_policies[0].admins[1] | string | `"prometheus"` |  |
| gcp.buckets_policies[0].name | string | `"thanos"` |  |
| gcp.cloudsql[0].dataDiskSizeGb | int | `20` |  |
| gcp.cloudsql[0].databaseVersion | string | `"POSTGRES_11"` |  |
| gcp.cloudsql[0].name | string | `"core"` |  |
| gcp.cloudsql[0].region | string | `"europe-west1"` |  |
| gcp.cloudsql[0].tier | string | `"db-custom-1-3840"` |  |
| gcp.firewall[0].allowed[0].IPProtocol | string | `"tcp"` |  |
| gcp.firewall[0].allowed[0].ports[0] | string | `"80"` |  |
| gcp.firewall[0].allowed[0].ports[1] | string | `"443"` |  |
| gcp.firewall[0].name | string | `"http-https"` |  |
| gcp.firewall[0].sourceRanges[0] | string | `"0.0.0.0/0"` |  |
| gcp.gke.addonsConfig.cloudRunConfig.disabled | bool | `true` |  |
| gcp.gke.addonsConfig.cloudRunConfig.loadBalancerType | string | `"LOAD_BALANCER_TYPE_UNSPECIFIED"` |  |
| gcp.gke.addonsConfig.configConnectorConfig.enabled | bool | `false` |  |
| gcp.gke.addonsConfig.dnsCacheConfig.enabled | bool | `true` |  |
| gcp.gke.addonsConfig.gcePersistentDiskCsiDriverConfig.enabled | bool | `true` |  |
| gcp.gke.addonsConfig.horizontalPodAutoscaling.disabled | bool | `true` |  |
| gcp.gke.addonsConfig.httpLoadBalancing.disabled | bool | `true` |  |
| gcp.gke.addonsConfig.kubernetesDashboard.disabled | bool | `true` |  |
| gcp.gke.addonsConfig.networkPolicyConfig.disabled | bool | `false` |  |
| gcp.gke.autopilot | bool | `false` |  |
| gcp.gke.binaryAuthorization | bool | `false` |  |
| gcp.gke.confidentialNodes | bool | `false` |  |
| gcp.gke.location | string | `"europe-west1-c"` |  |
| gcp.gke.networkConfig.datapathProvider | string | `"ADVANCED_DATAPATH"` |  |
| gcp.gke.networkConfig.enableIntraNodeVisibility | bool | `true` |  |
| gcp.gke.nodes[0].autoscaling.enabled | bool | `true` |  |
| gcp.gke.nodes[0].autoscaling.maxNodeCount | int | `4` |  |
| gcp.gke.nodes[0].autoscaling.minNodeCount | int | `2` |  |
| gcp.gke.nodes[0].diskSizeGb | int | `120` |  |
| gcp.gke.nodes[0].diskType | string | `"pd-ssd"` |  |
| gcp.gke.nodes[0].imageType | string | `"cos_containerd"` |  |
| gcp.gke.nodes[0].initialNodeCount | int | `2` |  |
| gcp.gke.nodes[0].locations[0] | string | `"europe-west1-c"` |  |
| gcp.gke.nodes[0].machineType | string | `"n1-standard-1"` |  |
| gcp.gke.nodes[0].management.autoRepair | bool | `true` |  |
| gcp.gke.nodes[0].management.autoUpgrade | bool | `true` |  |
| gcp.gke.nodes[0].name | string | `"core"` |  |
| gcp.gke.nodes[0].sandboxConfig.type | string | `"gvisor"` |  |
| gcp.gke.nodes[1].autoscaling.enabled | bool | `true` |  |
| gcp.gke.nodes[1].autoscaling.maxNodeCount | int | `1` |  |
| gcp.gke.nodes[1].autoscaling.minNodeCount | int | `0` |  |
| gcp.gke.nodes[1].diskSizeGb | int | `120` |  |
| gcp.gke.nodes[1].diskType | string | `"pd-ssd"` |  |
| gcp.gke.nodes[1].imageType | string | `"cos_containerd"` |  |
| gcp.gke.nodes[1].initialNodeCount | int | `0` |  |
| gcp.gke.nodes[1].locations[0] | string | `"europe-west1-c"` |  |
| gcp.gke.nodes[1].machineType | string | `"n1-standard-1"` |  |
| gcp.gke.nodes[1].management.autoRepair | bool | `true` |  |
| gcp.gke.nodes[1].management.autoUpgrade | bool | `true` |  |
| gcp.gke.nodes[1].name | string | `"ops"` |  |
| gcp.gke.releaseChannel | string | `"REGULAR"` |  |
| gcp.memorystore[0].memorySizeGb | int | `1` |  |
| gcp.memorystore[0].name | string | `"core"` |  |
| gcp.memorystore[0].region | string | `"europe-west1"` |  |
| gcp.memorystore[0].tier | string | `"STANDARD_HA"` |  |
| gcp.project_id | string | `"crossplane-gcp-test"` | The Google Cloud project ID |
| gcp.region | string | `"europe-west1"` | The Google Cloud region |
| gcp.service_accounts[0].name | string | `"prometheus"` |  |
| gcp.service_accounts[0].namespace | string | `"monitoring"` |  |
| gcp.service_accounts[1].name | string | `"thanos"` |  |
| gcp.service_accounts[1].namespace | string | `"monitoring"` |  |
| gcp.service_accounts[2].name | string | `"grafana"` |  |
| gcp.service_accounts[2].namespace | string | `"monitoring"` |  |
| gcp.service_accounts[3].name | string | `"loki"` |  |
| gcp.service_accounts[3].namespace | string | `"logging"` |  |
| gcp.service_accounts[4].name | string | `"tempo"` |  |
| gcp.service_accounts[4].namespace | string | `"tracing"` |  |
| gcp.subnetwork.ipCidrRange | string | `"10.11.0.0/20"` |  |
| gcp.subnetwork.secondaryIpRanges.pods | string | `"10.50.32.0/20"` |  |
| gcp.subnetwork.secondaryIpRanges.services | string | `"10.50.16.0/20"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
