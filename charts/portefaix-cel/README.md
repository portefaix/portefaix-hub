<!--
(NOTE: Do not edit README.md directly. It is a generated file!)
(      To make changes, please modify README.md.gotmpl and run `helm-docs`)
-->

# portefaix-cel

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.30.0](https://img.shields.io/badge/AppVersion-v1.30.0-informational?style=flat-square)

A Helm chart for validating admission policies use the Common Expression Language

**Homepage:** <https://charts.portefaix.xyz>

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
helm upgrade -i <release_name> portefaix-hub/pyrra-service-levels
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/orgs/portefaix/packages).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/portefaix/portefaix-hub/pyrra-service-levels --version=<version>
```

### Install chart

To install the chart with the release name `my-release`:

```bash
cat >> values.yaml << EOF
additionalLabels:
  app: pyrra-service-levels

EOF
helm install pyrra-service-levels --atomic --timeout 300s  portefaix-hub/portefaix-cel --values values.yaml
```

## Maintainers

| Name       | Email                         | Url |
| ---------- | ----------------------------- | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |     |

## Source Code

- <https://github.com/nlamirault/portefaix-hub/tree/master/charts/portefaix-cel>

<!-- markdownlint-disable no-bare-urls -->

## Requirements

| Repository | Name | Version |
| ---------- | ---- | ------- |
|            | crds | 0.0.0   |

<!-- markdownlint-enable no-bare-urls -->

## Values

| Key              | Type   | Default                                                                                                                                                          | Description                                                  |
| ---------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| additionalLabels | object | `{}`                                                                                                                                                             | Additional labels to add to all resources                    |
| fullnameOverride | string | `""`                                                                                                                                                             | Provide a name to substitute for the full names of resources |
| policies.c0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must not use latest image tag                      |
| policies.c0002   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must set liveness probe                            |
| policies.c0003   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must set readiness probe                           |
| policies.c0008   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container resource constraints must be specified             |
| policies.m0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata must set recommanded Kubernetes labels              |
| policies.m0002   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata should have a8r.io annotations                      |
| policies.m0003   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata should have portefaix.xyz labels                    |
| policies.n0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Disallow default namespace for all resources                 |
| policies.p0001   | object | `{"enabled":true,"params":{"publicRegistries":["ghcr.io","public.ecr.aws","docker.io"],"untrustedRegistries":["quay.io"]},"validationActions":["Warn","Audit"]}` | Authorized registry                                          |

## Customizing the configuration

There are several options for customizing the configuration generated by this chart.

### Service Levels

# portefaix-cel

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.30.0](https://img.shields.io/badge/AppVersion-v1.30.0-informational?style=flat-square)

A Helm chart for validating admission policies use the Common Expression Language

**Homepage:** <https://charts.portefaix.xyz>

## Maintainers

| Name       | Email                         | Url |
| ---------- | ----------------------------- | --- |
| nlamirault | <nicolas.lamirault@gmail.com> |     |

## Source Code

- <https://github.com/nlamirault/portefaix-hub/tree/master/charts/portefaix-cel>

## Requirements

| Repository | Name | Version |
| ---------- | ---- | ------- |
|            | crds | 0.0.0   |

## Values

| Key              | Type   | Default                                                                                                                                                          | Description                                                  |
| ---------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| additionalLabels | object | `{}`                                                                                                                                                             | Additional labels to add to all resources                    |
| fullnameOverride | string | `""`                                                                                                                                                             | Provide a name to substitute for the full names of resources |
| policies.c0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must not use latest image tag                      |
| policies.c0002   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must set liveness probe                            |
| policies.c0003   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container must set readiness probe                           |
| policies.c0008   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Container resource constraints must be specified             |
| policies.m0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata must set recommanded Kubernetes labels              |
| policies.m0002   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata should have a8r.io annotations                      |
| policies.m0003   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Metadata should have portefaix.xyz labels                    |
| policies.n0001   | object | `{"enabled":true,"validationActions":["Warn","Audit"]}`                                                                                                          | Disallow default namespace for all resources                 |
| policies.p0001   | object | `{"enabled":true,"params":{"publicRegistries":["ghcr.io","public.ecr.aws","docker.io"],"untrustedRegistries":["quay.io"]},"validationActions":["Warn","Audit"]}` | Authorized registry                                          |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
