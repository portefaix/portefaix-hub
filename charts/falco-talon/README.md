<!--
(NOTE: Do not edit README.md directly. It is a generated file!)
(      To make changes, please modify README.md.gotmpl and run `helm-docs`)
-->

** WAITING FOR OFFICIEL CHART **

# falco-talon

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

React to events from Falco

**Homepage:** <https://github.com/falco-talon/falco-talon>

## Breaking change announcements

### **v1.0.0**

This is the first release

## Usage

### Setup Portefaix chart repository

```shell
helm repo add portefaix-hub https://charts.portefaix.xyz/
helm repo update
```

Once the chart has been added, install one of the available charts:

```shell
helm upgrade -i <release_name> portefaix-hub/falco-talon
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/orgs/portefaix/packages).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/portefaix/portefaix-hub/falco-talon --version=<version>
```

### Install chart

To install the chart with the release name `my-release`:

```bash
cat >> values.yaml << EOF
additionalLabels:
  app: falco-talon

EOF
helm install falco-talon --atomic --timeout 300s  portefaix-hub/falco-talon --values values.yaml
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |  |

## Source Code

* <https://github.com/falco-talon/falco-talon>
* <https://github.com/nlamirault/portefaix-hub/tree/master/charts/falco-talon>

<!-- markdownlint-disable no-bare-urls -->

<!-- markdownlint-enable no-bare-urls -->

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalLabels | object | `{}` | Additional labels to add to all resources |
| affinity | object | `{}` |  |
| config.aws.accesKey | string | `""` |  |
| config.aws.externalId | string | `""` |  |
| config.aws.region | string | `""` |  |
| config.aws.roleArn | string | `""` |  |
| config.aws.secretKey | string | `""` |  |
| config.deduplication.leaderElection | bool | `true` |  |
| config.deduplication.timeWindowSeconds | int | `5` |  |
| config.defaultNotifiers[0] | string | `"k8sevents"` |  |
| config.minio.accessKy | string | `""` |  |
| config.minio.endpoint | string | `""` |  |
| config.minio.secretKey | string | `""` |  |
| config.minio.useSsl | bool | `false` |  |
| config.notifiers.elasticsearch.createIndexTemplate | bool | `true` |  |
| config.notifiers.elasticsearch.numberOfReplicas | int | `1` |  |
| config.notifiers.elasticsearch.numberOfShards | int | `1` |  |
| config.notifiers.elasticsearch.url | string | `""` |  |
| config.notifiers.loki.apiKey | string | `""` |  |
| config.notifiers.loki.customHeaders | list | `[]` |  |
| config.notifiers.loki.hostPort | string | `""` |  |
| config.notifiers.loki.tenant | string | `""` |  |
| config.notifiers.loki.user | string | `""` |  |
| config.notifiers.slack.footer | string | `"https://github.com/falco-talon/falco-talon"` |  |
| config.notifiers.slack.format | string | `"long"` |  |
| config.notifiers.slack.icon | string | `"https://upload.wikimedia.org/wikipedia/commons/2/26/Circaetus_gallicus_claw.jpg"` |  |
| config.notifiers.slack.username | string | `"Falco Talon"` |  |
| config.notifiers.slack.webhookUrl | string | `""` |  |
| config.notifiers.smtp.format | string | `"html"` |  |
| config.notifiers.smtp.from | string | `""` |  |
| config.notifiers.smtp.hostPort | string | `""` |  |
| config.notifiers.smtp.password | string | `""` |  |
| config.notifiers.smtp.tls | bool | `false` |  |
| config.notifiers.smtp.to | string | `""` |  |
| config.notifiers.smtp.user | string | `""` |  |
| config.notifiers.webhook.url | string | `""` |  |
| config.printAllEvents | bool | `false` |  |
| config.rulesFiles[0] | string | `"rules/rules.yaml"` |  |
| config.rulesFiles[1] | string | `"rules/rules_override.yaml"` |  |
| config.watchRules | bool | `true` |  |
| extraEnv[0].name | string | `"LOG_LEVEL"` |  |
| extraEnv[0].value | string | `"warning"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"falco.docker.scarf.sh"` |  |
| image.repository | string | `"issif/falco-talon"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"falco-talon.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1234` |  |
| podSecurityContext.runAsUser | int | `1234` |  |
| podSecurityPolicy.create | bool | `false` |  |
| priorityClassName | string | `""` |  |
| rbac.caliconetworkpolicies[0] | string | `"get"` |  |
| rbac.caliconetworkpolicies[1] | string | `"update"` |  |
| rbac.caliconetworkpolicies[2] | string | `"patch"` |  |
| rbac.caliconetworkpolicies[3] | string | `"create"` |  |
| rbac.ciliumnetworkpolicies[0] | string | `"get"` |  |
| rbac.ciliumnetworkpolicies[1] | string | `"update"` |  |
| rbac.ciliumnetworkpolicies[2] | string | `"patch"` |  |
| rbac.ciliumnetworkpolicies[3] | string | `"create"` |  |
| rbac.clusterroles[0] | string | `"get"` |  |
| rbac.clusterroles[1] | string | `"delete"` |  |
| rbac.configmaps[0] | string | `"get"` |  |
| rbac.configmaps[1] | string | `"delete"` |  |
| rbac.daemonsets[0] | string | `"get"` |  |
| rbac.daemonsets[1] | string | `"delete"` |  |
| rbac.deployments[0] | string | `"get"` |  |
| rbac.deployments[1] | string | `"delete"` |  |
| rbac.events[0] | string | `"get"` |  |
| rbac.events[1] | string | `"update"` |  |
| rbac.events[2] | string | `"patch"` |  |
| rbac.events[3] | string | `"create"` |  |
| rbac.leases[0] | string | `"get"` |  |
| rbac.leases[1] | string | `"update"` |  |
| rbac.leases[2] | string | `"patch"` |  |
| rbac.leases[3] | string | `"watch"` |  |
| rbac.leases[4] | string | `"create"` |  |
| rbac.namespaces[0] | string | `"get"` |  |
| rbac.networkpolicies[0] | string | `"get"` |  |
| rbac.networkpolicies[1] | string | `"update"` |  |
| rbac.networkpolicies[2] | string | `"patch"` |  |
| rbac.networkpolicies[3] | string | `"create"` |  |
| rbac.nodes[0] | string | `"get"` |  |
| rbac.nodes[1] | string | `"update"` |  |
| rbac.nodes[2] | string | `"patch"` |  |
| rbac.nodes[3] | string | `"watch"` |  |
| rbac.nodes[4] | string | `"create"` |  |
| rbac.podsEphemeralcontainers[0] | string | `"patch"` |  |
| rbac.podsEphemeralcontainers[1] | string | `"create"` |  |
| rbac.podsEviction[0] | string | `"get"` |  |
| rbac.podsEviction[1] | string | `"create"` |  |
| rbac.podsExec[0] | string | `"get"` |  |
| rbac.podsExec[1] | string | `"create"` |  |
| rbac.pods[0] | string | `"get"` |  |
| rbac.pods[1] | string | `"update"` |  |
| rbac.pods[2] | string | `"patch"` |  |
| rbac.pods[3] | string | `"delete"` |  |
| rbac.pods[4] | string | `"list"` |  |
| rbac.replicasets[0] | string | `"get"` |  |
| rbac.replicasets[1] | string | `"delete"` |  |
| rbac.roles[0] | string | `"get"` |  |
| rbac.roles[1] | string | `"delete"` |  |
| rbac.secrets[0] | string | `"get"` |  |
| rbac.secrets[1] | string | `"delete"` |  |
| rbac.statefulsets[0] | string | `"get"` |  |
| rbac.statefulsets[1] | string | `"delete"` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `2803` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor | object | `{"additionalLabels":{},"enabled":false,"interval":"30s","path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"10s","targetLabels":[],"tlsConfig":{}}` | serviceMonitor holds the configuration for the ServiceMonitor CRD. |
| serviceMonitor.additionalLabels | object | `{}` | additionalLabels specifies labels to be added on the Service Monitor. |
| serviceMonitor.enabled | bool | `false` | enable the deployment of a Service Monitor for the Prometheus Operator. |
| serviceMonitor.interval | string | `"30s"` | interval specifies the time interval at which Prometheus should scrape metrics from the service. |
| serviceMonitor.path | string | `"/metrics"` | path at which the metrics are expose |
| serviceMonitor.relabelings | list | `[]` | relabelings configures the relabeling rules to apply the target’s metadata labels. |
| serviceMonitor.scheme | string | `"http"` | scheme specifies network protocol used by the metrics endpoint. In this case HTTP. |
| serviceMonitor.scrapeTimeout | string | `"10s"` | scrapeTimeout determines the maximum time Prometheus should wait for a target to respond to a scrape request. If the target does not respond within the specified timeout, Prometheus considers the scrape as failed for that target. |
| serviceMonitor.targetLabels | list | `[]` | targetLabels defines the labels which are transferred from the associated Kubernetes service object onto the ingested metrics. |
| serviceMonitor.tlsConfig | object | `{}` | tlsConfig specifies TLS (Transport Layer Security) configuration for secure communication when scraping metrics from a service. It allows you to define the details of the TLS connection, such as CA certificate, client certificate, and client key. Currently, the k8s-metacollector does not support TLS configuration for the metrics endpoint. |
| tolerations | list | `[]` |  |

## Customizing the configuration

There are several options for customizing the configuration generated by this chart.

### Policies

You can choose which policies to enable or disable.

You can choose for each policy the [validation action](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/#validation-actions)
# falco-talon

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

React to events from Falco

**Homepage:** <https://github.com/falco-talon/falco-talon>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |  |

## Source Code

* <https://github.com/falco-talon/falco-talon>
* <https://github.com/nlamirault/portefaix-hub/tree/master/charts/falco-talon>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalLabels | object | `{}` | Additional labels to add to all resources |
| affinity | object | `{}` |  |
| config.aws.accesKey | string | `""` |  |
| config.aws.externalId | string | `""` |  |
| config.aws.region | string | `""` |  |
| config.aws.roleArn | string | `""` |  |
| config.aws.secretKey | string | `""` |  |
| config.deduplication.leaderElection | bool | `true` |  |
| config.deduplication.timeWindowSeconds | int | `5` |  |
| config.defaultNotifiers[0] | string | `"k8sevents"` |  |
| config.minio.accessKy | string | `""` |  |
| config.minio.endpoint | string | `""` |  |
| config.minio.secretKey | string | `""` |  |
| config.minio.useSsl | bool | `false` |  |
| config.notifiers.elasticsearch.createIndexTemplate | bool | `true` |  |
| config.notifiers.elasticsearch.numberOfReplicas | int | `1` |  |
| config.notifiers.elasticsearch.numberOfShards | int | `1` |  |
| config.notifiers.elasticsearch.url | string | `""` |  |
| config.notifiers.loki.apiKey | string | `""` |  |
| config.notifiers.loki.customHeaders | list | `[]` |  |
| config.notifiers.loki.hostPort | string | `""` |  |
| config.notifiers.loki.tenant | string | `""` |  |
| config.notifiers.loki.user | string | `""` |  |
| config.notifiers.slack.footer | string | `"https://github.com/falco-talon/falco-talon"` |  |
| config.notifiers.slack.format | string | `"long"` |  |
| config.notifiers.slack.icon | string | `"https://upload.wikimedia.org/wikipedia/commons/2/26/Circaetus_gallicus_claw.jpg"` |  |
| config.notifiers.slack.username | string | `"Falco Talon"` |  |
| config.notifiers.slack.webhookUrl | string | `""` |  |
| config.notifiers.smtp.format | string | `"html"` |  |
| config.notifiers.smtp.from | string | `""` |  |
| config.notifiers.smtp.hostPort | string | `""` |  |
| config.notifiers.smtp.password | string | `""` |  |
| config.notifiers.smtp.tls | bool | `false` |  |
| config.notifiers.smtp.to | string | `""` |  |
| config.notifiers.smtp.user | string | `""` |  |
| config.notifiers.webhook.url | string | `""` |  |
| config.printAllEvents | bool | `false` |  |
| config.rulesFiles[0] | string | `"rules/rules.yaml"` |  |
| config.rulesFiles[1] | string | `"rules/rules_override.yaml"` |  |
| config.watchRules | bool | `true` |  |
| extraEnv[0].name | string | `"LOG_LEVEL"` |  |
| extraEnv[0].value | string | `"warning"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"falco.docker.scarf.sh"` |  |
| image.repository | string | `"issif/falco-talon"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"falco-talon.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1234` |  |
| podSecurityContext.runAsUser | int | `1234` |  |
| podSecurityPolicy.create | bool | `false` |  |
| priorityClassName | string | `""` |  |
| rbac.caliconetworkpolicies[0] | string | `"get"` |  |
| rbac.caliconetworkpolicies[1] | string | `"update"` |  |
| rbac.caliconetworkpolicies[2] | string | `"patch"` |  |
| rbac.caliconetworkpolicies[3] | string | `"create"` |  |
| rbac.ciliumnetworkpolicies[0] | string | `"get"` |  |
| rbac.ciliumnetworkpolicies[1] | string | `"update"` |  |
| rbac.ciliumnetworkpolicies[2] | string | `"patch"` |  |
| rbac.ciliumnetworkpolicies[3] | string | `"create"` |  |
| rbac.clusterroles[0] | string | `"get"` |  |
| rbac.clusterroles[1] | string | `"delete"` |  |
| rbac.configmaps[0] | string | `"get"` |  |
| rbac.configmaps[1] | string | `"delete"` |  |
| rbac.daemonsets[0] | string | `"get"` |  |
| rbac.daemonsets[1] | string | `"delete"` |  |
| rbac.deployments[0] | string | `"get"` |  |
| rbac.deployments[1] | string | `"delete"` |  |
| rbac.events[0] | string | `"get"` |  |
| rbac.events[1] | string | `"update"` |  |
| rbac.events[2] | string | `"patch"` |  |
| rbac.events[3] | string | `"create"` |  |
| rbac.leases[0] | string | `"get"` |  |
| rbac.leases[1] | string | `"update"` |  |
| rbac.leases[2] | string | `"patch"` |  |
| rbac.leases[3] | string | `"watch"` |  |
| rbac.leases[4] | string | `"create"` |  |
| rbac.namespaces[0] | string | `"get"` |  |
| rbac.networkpolicies[0] | string | `"get"` |  |
| rbac.networkpolicies[1] | string | `"update"` |  |
| rbac.networkpolicies[2] | string | `"patch"` |  |
| rbac.networkpolicies[3] | string | `"create"` |  |
| rbac.nodes[0] | string | `"get"` |  |
| rbac.nodes[1] | string | `"update"` |  |
| rbac.nodes[2] | string | `"patch"` |  |
| rbac.nodes[3] | string | `"watch"` |  |
| rbac.nodes[4] | string | `"create"` |  |
| rbac.podsEphemeralcontainers[0] | string | `"patch"` |  |
| rbac.podsEphemeralcontainers[1] | string | `"create"` |  |
| rbac.podsEviction[0] | string | `"get"` |  |
| rbac.podsEviction[1] | string | `"create"` |  |
| rbac.podsExec[0] | string | `"get"` |  |
| rbac.podsExec[1] | string | `"create"` |  |
| rbac.pods[0] | string | `"get"` |  |
| rbac.pods[1] | string | `"update"` |  |
| rbac.pods[2] | string | `"patch"` |  |
| rbac.pods[3] | string | `"delete"` |  |
| rbac.pods[4] | string | `"list"` |  |
| rbac.replicasets[0] | string | `"get"` |  |
| rbac.replicasets[1] | string | `"delete"` |  |
| rbac.roles[0] | string | `"get"` |  |
| rbac.roles[1] | string | `"delete"` |  |
| rbac.secrets[0] | string | `"get"` |  |
| rbac.secrets[1] | string | `"delete"` |  |
| rbac.statefulsets[0] | string | `"get"` |  |
| rbac.statefulsets[1] | string | `"delete"` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `2803` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor | object | `{"additionalLabels":{},"enabled":false,"interval":"30s","path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"10s","targetLabels":[],"tlsConfig":{}}` | serviceMonitor holds the configuration for the ServiceMonitor CRD. |
| serviceMonitor.additionalLabels | object | `{}` | additionalLabels specifies labels to be added on the Service Monitor. |
| serviceMonitor.enabled | bool | `false` | enable the deployment of a Service Monitor for the Prometheus Operator. |
| serviceMonitor.interval | string | `"30s"` | interval specifies the time interval at which Prometheus should scrape metrics from the service. |
| serviceMonitor.path | string | `"/metrics"` | path at which the metrics are expose |
| serviceMonitor.relabelings | list | `[]` | relabelings configures the relabeling rules to apply the target’s metadata labels. |
| serviceMonitor.scheme | string | `"http"` | scheme specifies network protocol used by the metrics endpoint. In this case HTTP. |
| serviceMonitor.scrapeTimeout | string | `"10s"` | scrapeTimeout determines the maximum time Prometheus should wait for a target to respond to a scrape request. If the target does not respond within the specified timeout, Prometheus considers the scrape as failed for that target. |
| serviceMonitor.targetLabels | list | `[]` | targetLabels defines the labels which are transferred from the associated Kubernetes service object onto the ingested metrics. |
| serviceMonitor.tlsConfig | object | `{}` | tlsConfig specifies TLS (Transport Layer Security) configuration for secure communication when scraping metrics from a service. It allows you to define the details of the TLS connection, such as CA certificate, client certificate, and client key. Currently, the k8s-metacollector does not support TLS configuration for the metrics endpoint. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
