<!--
(NOTE: Do not edit README.md directly. It is a generated file!)
(      To make changes, please modify README.md.gotmpl and run `helm-docs`)
-->

** WAITING FOR OFFICIEL CHART **

This Helm chart deploys OLake data synchronization as a Kubernetes CronJob. OLake enables efficient data
synchronization from various source databases (MongoDB, MySQL, PostgreSQL) to destination data warehouses.

OLake is a data integration tool that helps automate recurring data synchronization operations using a pre-generated
streams file. This chart sets up the necessary components for running OLake sync jobs on Kubernetes.

# olake

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for OLake data synchronization

**Homepage:** <https://olake.io/>

## Breaking change announcements

### **v1.0.0**

WIP

## Usage

### Setup Portefaix chart repository

```shell
helm repo add portefaix-hub https://charts.portefaix.xyz/
helm repo update
```

Once the chart has been added, install one of the available charts:

```shell
helm upgrade -i <release_name> portefaix-hub/olake
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/orgs/portefaix/packages).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/portefaix/portefaix-hub/olake --version=<version>
```

### Install chart

To install the chart with the release name `my-release`:

```bash
cat >> values.yaml << EOF
additionalLabels:
  app: olake

EOF
helm install olake --atomic --timeout 300s  portefaix-hub/olake --values values.yaml
```

### Uninstalling the Chart

To uninstall/delete the `olake` deployment:

```bash
helm uninstall olake -n olake
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DataZip Inc. |  | <https://olake.io/> |

## Source Code

* <https://github.com/datazip-inc/olake-docs>

<!-- markdownlint-disable no-bare-urls -->

<!-- markdownlint-enable no-bare-urls -->

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| container.image.pullPolicy | string | `"Always"` |  |
| container.image.repository | string | `"olakego/source-mongodb"` |  |
| container.image.tag | string | `"latest"` |  |
| container.resources | object | `{}` |  |
| cronJob.affinity | object | `{}` | Affinity for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| cronJob.backoffLimit | int | `5` |  |
| cronJob.concurrencyPolicy | string | `"Forbid"` |  |
| cronJob.failedJobsHistoryLimit | int | `5` |  |
| cronJob.name | string | `"olake-sync"` |  |
| cronJob.nodeSelector | object | `{}` | Node labels for pod assignment Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| cronJob.schedule | string | `"*/5 * * * *"` |  |
| cronJob.securityContext | object | `{}` |  |
| cronJob.successfulJobsHistoryLimit | int | `3` |  |
| cronJob.suspend | bool | `true` |  |
| cronJob.tolerations | list | `[]` | Tolerations for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| destination.config.type | string | `"ICEBERG"` |  |
| destination.config.writer.catalog_type | string | `"glue"` |  |
| destination.config.writer.grpc_port | int | `50051` |  |
| destination.config.writer.normalization | bool | `false` |  |
| destination.config.writer.server_host | string | `"localhost"` |  |
| destination.createSecret | bool | `true` |  |
| destination.secretName | string | `"olake-destination"` |  |
| destination.secrets.aws_access_key | string | `""` |  |
| destination.secrets.aws_region | string | `""` |  |
| destination.secrets.aws_secret_key | string | `""` |  |
| destination.secrets.iceberg_db | string | `""` |  |
| destination.secrets.iceberg_s3_path | string | `""` |  |
| initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| initContainer.image.repository | string | `"busybox"` |  |
| initContainer.image.tag | string | `"latest"` |  |
| namespace | string | `"olake"` |  |
| persistentVolumeClaim.accessModes[0] | string | `"ReadWriteMany"` |  |
| persistentVolumeClaim.name | string | `"olake-config"` |  |
| persistentVolumeClaim.storage | string | `"1Gi"` |  |
| persistentVolumeClaim.storageClassName | string | `"standard"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` | Specifies whether a ServiceAccount should be created |
| serviceAccount.name | string | `nil` |  |
| source.config.authdb | string | `"admin"` |  |
| source.config.backoffRetryCount | int | `4` |  |
| source.config.database | string | `"database"` |  |
| source.config.defaultMode | string | `"cdc"` |  |
| source.config.hosts[0] | string | `"host1:27017"` |  |
| source.config.hosts[1] | string | `"host2:27017"` |  |
| source.config.hosts[2] | string | `"host3:27017"` |  |
| source.config.maxThreads | int | `5` |  |
| source.config.partitionStrategy | string | `""` |  |
| source.config.password | string | `"test"` |  |
| source.config.readPreference | string | `"secondaryPreferred"` |  |
| source.config.replicaSet | string | `"rs0"` |  |
| source.config.serverRam | int | `16` |  |
| source.config.srv | bool | `true` |  |
| source.config.username | string | `"test"` |  |
| source.configMapName | string | `"olake-source"` |  |
| streams.config.selected_streams.otter_db[0].partition_regex | string | `"{now(),2025,YY}-{now(),06,MM}-{now(),13,DD}/{string_change_language,,}"` |  |
| streams.config.selected_streams.otter_db[0].stream_name | string | `"stream_0"` |  |
| streams.config.selected_streams.otter_db[1].partition_regex | string | `"{,1999,YY}-{,09,MM}-{,31,DD}/{latest_revision,,}"` |  |
| streams.config.selected_streams.otter_db[1].stream_name | string | `"stream_8"` |  |
| streams.configMapName | string | `"olake-streams"` |  |

## Additional Information

For more information about OLake, please visit:
- [OLake Website](https://olake.io/)
- [OLake Documentation](https://olake.io/docs/)
