# secrets-store-csi-driver-provider-aws

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.r2](https://img.shields.io/badge/AppVersion-1.0.r2-informational?style=flat-square)

A Helm chart for AWS Secret Manager Provider for Secret Store CSI Driver

**Homepage:** <https://charts.portefaix.xyz>

## Maintainers

| Name       | Email                         | Url |
| ---------- | ----------------------------- | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |     |

## Source Code

- <https://github.com/portefaix/portefaix-hub/tree/master/charts/secrets-store-csi-driver-provider-aws>

## Values

| Key                             | Type   | Default                                                                      | Description                                                                                                             |
| ------------------------------- | ------ | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| additionalAnnotations           | object | `{}`                                                                         | Additional annotations to add to metadata                                                                               |
| additionalLabels                | object | `{}`                                                                         | Additional labels to add to metadata                                                                                    |
| affinity                        | object | `{}`                                                                         | Affinity settings for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/          |
| fullnameOverride                | string | `""`                                                                         | Provide a name to substitute for the full names of resources                                                            |
| image.pullPolicy                | string | `"IfNotPresent"`                                                             |                                                                                                                         |
| image.repository                | string | `"public.ecr.aws/aws-secrets-manager/secrets-store-csi-driver-provider-aws"` |                                                                                                                         |
| image.tag                       | string | `"1.0.r2-2021.08.13.20.34-linux-amd64"`                                      |                                                                                                                         |
| imagePullSecrets                | list   | `[]`                                                                         |                                                                                                                         |
| namespace                       | string | `"kube-system"`                                                              | Namespace to deploy the Secret Store CSI Driver                                                                         |
| nodeSelector                    | object | `{"kubernetes.io/os":"linux"}`                                               | Node labels for pod assignment # Ref: https://kubernetes.io/docs/user-guide/node-selection/                             |
| rbac.create                     | bool   | `true`                                                                       | If true, create & use RBAC resources                                                                                    |
| resources                       | object | `{}`                                                                         | Container resources (requests and limits for cpu and memory)                                                            |
| serviceAccount.annotations      | object | `{}`                                                                         | ServiceAccount annotations. # Use case: GKE Workload Identity for service accounts                                      |
| serviceAccount.create           | bool   | `true`                                                                       | Specifies whether a ServiceAccount should be created, require rbac true                                                 |
| serviceAccount.imagePullSecrets | list   | `[]`                                                                         |                                                                                                                         |
| serviceAccount.name             | string | `nil`                                                                        | The name of the ServiceAccount to use. # If not set and create is true, a name is generated using the fullname template |
| tolerations                     | list   | `[]`                                                                         | Tolerations for pod assignment # Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/           |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
