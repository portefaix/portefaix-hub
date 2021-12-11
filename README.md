# Portefaix Hub

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![](https://github.com/portefaix-hub/charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/portefaix-hub/charts/actions)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/portefaix-hub)](https://artifacthub.io/packages/search?repo=portefaix-hub)

Charts are available in the following formats:

* [Chart Repository](https://helm.sh/docs/topics/chart_repository/)
* [OCI Artifacts](https://helm.sh/docs/topics/registries/)

### Installing from the Chart Repository

The following command can be used to add the chart repository:

```shell
$ helm repo add portefaix-hub https://charts.portefaix.xyz/
$ helm repo update
```

Once the chart has been added, install one of the available charts:

```shell
$ helm upgrade -i <release_name> portefaix-hub/<chart_name>
```

### Installing from an OCI Registry

Charts are also available in OCI format. The list of available charts can be found [here](https://github.com/orgs/portefaix/packages).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/portefaix/portefaix-hub/<chart_name> --version=<version>
```

## Charts

See [Artifact Hub](https://artifacthub.io/packages/search?repo=portefaix-hub) for a complete list.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
