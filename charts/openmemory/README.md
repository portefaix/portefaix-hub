# openmemory

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Openmemory from Mem0 - Memory for AI Agents

**Homepage:** <https://github.com/mem0ai/mem0>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | <nicolas.lamirault@gmail.com> | <https://github.com/nlamirault> |

## Source Code

* <https://github.com/mem0ai/mem0>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://qdrant.github.io/qdrant-helm | qdrant | 0.8.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalLabels | object | `{}` | Additional labels to add to all resources |
| api.affinity | object | `{}` |  |
| api.autoscaling.behavior | object | `{}` |  |
| api.autoscaling.customMetrics | list | `[]` |  |
| api.autoscaling.enabled | bool | `false` |  |
| api.autoscaling.maxReplicas | int | `10` |  |
| api.autoscaling.minReplicas | int | `1` |  |
| api.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| api.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| api.enabled | bool | `true` |  |
| api.env.API_KEY | string | `""` |  |
| api.env.USER | string | `"default"` |  |
| api.envFrom | list | `[]` |  |
| api.gateway.annotations | object | `{}` |  |
| api.gateway.enabled | bool | `false` |  |
| api.gateway.gatewayName | string | `"default-gateway"` |  |
| api.gateway.gatewayNamespace | string | `""` |  |
| api.gateway.hostnames[0] | string | `"api.openmemory.local"` |  |
| api.gateway.parentRefs | list | `[]` |  |
| api.gateway.rules | list | `[]` |  |
| api.gateway.sectionName | string | `""` |  |
| api.image.pullPolicy | string | `"IfNotPresent"` |  |
| api.image.repository | string | `"mem0/openmemory-api"` |  |
| api.image.tag | string | `"v1.0.0"` |  |
| api.ingress.annotations | object | `{}` |  |
| api.ingress.className | string | `""` |  |
| api.ingress.enabled | bool | `false` |  |
| api.ingress.hosts[0].host | string | `"api.openmemory.local"` |  |
| api.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| api.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| api.ingress.tls | list | `[]` |  |
| api.nodeSelector | object | `{}` |  |
| api.replicaCount | int | `1` |  |
| api.resources | object | `{}` |  |
| api.service.port | int | `8765` |  |
| api.service.targetPort | int | `8765` |  |
| api.service.type | string | `"ClusterIP"` |  |
| api.tolerations | list | `[]` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.imageRegistry | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| mcp.affinity | object | `{}` |  |
| mcp.autoscaling.behavior | object | `{}` |  |
| mcp.autoscaling.customMetrics | list | `[]` |  |
| mcp.autoscaling.enabled | bool | `false` |  |
| mcp.autoscaling.maxReplicas | int | `10` |  |
| mcp.autoscaling.minReplicas | int | `1` |  |
| mcp.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| mcp.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| mcp.enabled | bool | `true` |  |
| mcp.env.API_KEY | string | `""` |  |
| mcp.env.USER | string | `"default"` |  |
| mcp.envFrom | list | `[]` |  |
| mcp.gateway.annotations | object | `{}` |  |
| mcp.gateway.enabled | bool | `false` |  |
| mcp.gateway.gatewayName | string | `"default-gateway"` |  |
| mcp.gateway.gatewayNamespace | string | `""` |  |
| mcp.gateway.hostnames[0] | string | `"mcp.openmemory.local"` |  |
| mcp.gateway.parentRefs | list | `[]` |  |
| mcp.gateway.rules | list | `[]` |  |
| mcp.gateway.sectionName | string | `""` |  |
| mcp.image.pullPolicy | string | `"IfNotPresent"` |  |
| mcp.image.repository | string | `"mem0/openmemory-mcp"` |  |
| mcp.image.tag | string | `"v1.0.0"` |  |
| mcp.ingress.annotations | object | `{}` |  |
| mcp.ingress.className | string | `""` |  |
| mcp.ingress.enabled | bool | `false` |  |
| mcp.ingress.hosts[0].host | string | `"mcp.openmemory.local"` |  |
| mcp.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| mcp.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| mcp.ingress.tls | list | `[]` |  |
| mcp.nodeSelector | object | `{}` |  |
| mcp.replicaCount | int | `1` |  |
| mcp.resources | object | `{}` |  |
| mcp.service.port | int | `8765` |  |
| mcp.service.targetPort | int | `8765` |  |
| mcp.service.type | string | `"ClusterIP"` |  |
| mcp.tolerations | list | `[]` |  |
| networkPolicy.egress | list | `[]` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress | list | `[]` |  |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podSecurityContext.fsGroup | int | `65534` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65534` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| qdrant | object | `{"enabled":true,"persistence":{"enabled":true,"size":"8Gi"},"resources":{"limits":{"cpu":"500m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"512Mi"}},"service":{"port":6333}}` | ------------------------------------------ Qdrant dependency configuration |
| rbac.create | bool | `true` |  |
| rbac.rules | list | `[]` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| ui.affinity | object | `{}` |  |
| ui.autoscaling.behavior | object | `{}` |  |
| ui.autoscaling.customMetrics | list | `[]` |  |
| ui.autoscaling.enabled | bool | `false` |  |
| ui.autoscaling.maxReplicas | int | `5` |  |
| ui.autoscaling.minReplicas | int | `1` |  |
| ui.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| ui.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| ui.enabled | bool | `true` |  |
| ui.env.NEXT_PUBLIC_API_URL | string | `"http://openmemory-api:8765"` |  |
| ui.env.NEXT_PUBLIC_USER_ID | string | `"default"` |  |
| ui.envFrom | list | `[]` |  |
| ui.gateway.annotations | object | `{}` |  |
| ui.gateway.enabled | bool | `false` |  |
| ui.gateway.gatewayName | string | `"default-gateway"` |  |
| ui.gateway.gatewayNamespace | string | `""` |  |
| ui.gateway.hostnames[0] | string | `"openmemory.local"` |  |
| ui.gateway.parentRefs | list | `[]` |  |
| ui.gateway.rules | list | `[]` |  |
| ui.gateway.sectionName | string | `""` |  |
| ui.image.pullPolicy | string | `"IfNotPresent"` |  |
| ui.image.repository | string | `"mem0/openmemory-ui"` |  |
| ui.image.tag | string | `"v1.0.0"` |  |
| ui.ingress.annotations | object | `{}` |  |
| ui.ingress.className | string | `""` |  |
| ui.ingress.enabled | bool | `false` |  |
| ui.ingress.hosts[0].host | string | `"openmemory.local"` |  |
| ui.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ui.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ui.ingress.tls | list | `[]` |  |
| ui.nodeSelector | object | `{}` |  |
| ui.replicaCount | int | `1` |  |
| ui.resources | object | `{}` |  |
| ui.service.port | int | `3000` |  |
| ui.service.targetPort | int | `3000` |  |
| ui.service.type | string | `"ClusterIP"` |  |
| ui.tolerations | list | `[]` |  |
| updateStrategy.rollingUpdate.maxSurge | string | `"25%"` |  |
| updateStrategy.rollingUpdate.maxUnavailable | string | `"25%"` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
