# linkerd-stable-mixin

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: stable-2.10.2](https://img.shields.io/badge/AppVersion-stable--2.10.2-informational?style=flat-square)

A Helm chart for Linkerd Stable Mixin

**Homepage:** <https://charts.portefaix.xyz>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nlamirault | nicolas.lamirault@gmail.com |  |

## Source Code

* <https://github.com/nlamirault/portefaix-hub/tree/master/charts/linkerd-stable-mixin>

## Requirements

Kubernetes: `>= 1.14.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalAnnotations | object | `{}` | Additional annotations to add to the Prometheus rules |
| additionalLabels | object | `{}` | Additional labels to add to the Prometheus rules |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources |
| grafana.folder | string | `"linkerd"` | Grafana folder in which to store the dashboards |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)