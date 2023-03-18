# kubernetes-config-connector

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.101.0](https://img.shields.io/badge/AppVersion-1.101.0-informational?style=flat-square)

A Helm chart for Google Kubernetes Config Connector (kcc)

**Homepage:** <https://charts.portefaix.xyz>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |  |

## Source Code

* <https://cloud.google.com/config-connector/docs/overview>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional annotations to add to metadata |
| additionalLabels | object | `{}` | Additional labels to add to metadata |
| alias | string | `"cnrm"` | Alias name for resources names |
| controllerManager.affinity | object | `{}` | Affinity settings for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| controllerManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| controllerManager.image.repository | string | `"gcr.io/cnrm-eap/controller"` |  |
| controllerManager.image.tag | string | `"411c879"` |  |
| controllerManager.imagePullSecrets | list | `[]` |  |
| controllerManager.nodeSelector | object | `{}` | Node labels for pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| controllerManager.resources | object | `{}` | Container resources (requests and limits for cpu and memory) |
| controllerManager.tolerations | list | `[]` | Tolerations for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| deletionDefender.affinity | object | `{}` | Affinity settings for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| deletionDefender.image.pullPolicy | string | `"IfNotPresent"` |  |
| deletionDefender.image.repository | string | `"gcr.io/cnrm-eap/deletiondefender"` |  |
| deletionDefender.image.tag | string | `"411c879"` |  |
| deletionDefender.imagePullSecrets | list | `[]` |  |
| deletionDefender.nodeSelector | object | `{}` | Node labels for pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| deletionDefender.resources | object | `{}` | Container resources (requests and limits for cpu and memory) |
| deletionDefender.tolerations | list | `[]` | Tolerations for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources |
| namespaceOverride | string | `"cnrm-system"` | Namespace to deploy the controller |
| rbac.create | bool | `true` | If true, create & use RBAC resources |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| serviceAccount.annotations | object | `{"foo":"bar"}` | ServiceAccount annotations. # Use case: GKE Workload Identity for service accounts |
| serviceAccount.create | bool | `true` | Specifies whether a ServiceAccount should be created, require rbac true |
| serviceAccount.imagePullSecrets | list | `[]` |  |
| statsRecoder.affinity | object | `{}` | Affinity settings for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| statsRecoder.image.pullPolicy | string | `"IfNotPresent"` |  |
| statsRecoder.image.repository | string | `"gcr.io/cnrm-eap/recorder"` |  |
| statsRecoder.image.tag | string | `"411c879"` |  |
| statsRecoder.imagePullSecrets | list | `[]` |  |
| statsRecoder.nodeSelector | object | `{}` | Node labels for pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| statsRecoder.resources | object | `{}` | Container resources (requests and limits for cpu and memory) |
| statsRecoder.tolerations | list | `[]` | Tolerations for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| webhookManager.affinity | object | `{}` | Affinity settings for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| webhookManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| webhookManager.image.repository | string | `"gcr.io/cnrm-eap/webhook"` |  |
| webhookManager.image.tag | string | `"411c879"` |  |
| webhookManager.imagePullSecrets | list | `[]` |  |
| webhookManager.nodeSelector | object | `{}` | Node labels for pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| webhookManager.resources | object | `{}` | Container resources (requests and limits for cpu and memory) |
| webhookManager.tolerations | list | `[]` | Tolerations for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
