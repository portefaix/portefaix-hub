# Portefaix Hub

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![](https://github.com/portefaix-hub/charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/portefaix-hub/charts/actions)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/portefaix-hub)](https://artifacthub.io/packages/search?repo=portefaix-hub)

Charts are available in the following formats:

- [OCI Artifacts](https://helm.sh/docs/topics/registries/)

### Installing from an OCI Registry

Charts are available in OCI format. The list of available charts can be found [here](https://github.com/orgs/portefaix/packages).

Install one of the available charts:

```shell
$ helm upgrade -i oci://ghcr.io/portefaix/portefaix-hub/<chart_name> --version=<version>
```

## Charts

See [Artifact Hub](https://artifacthub.io/packages/search?repo=portefaix-hub) for a complete list.

## SLSA

All _artifacts_ provided by this repository meet [SLSA L3](https://slsa.dev/spec/v1.0/levels#build-l3)

### Verify SLSA provenance

Using the [Github CLI]():

```shell
$ gh attestation verify oci://ghcr.io/portefaix/charts/fake:0.1.0 --repo portefaix/portefaix-hub
Loaded digest sha256:84440dd6e696ed153a43490bdfdf9190d640d041fb4201f326578a4be829e811 for oci://ghcr.io/portefaix/charts/fake:0.1.0
Loaded 1 attestation from GitHub API
✓ Verification succeeded!

sha256:84440dd6e696ed153a43490bdfdf9190d640d041fb4201f326578a4be829e811 was attested by:
REPO                     PREDICATE_TYPE                  WORKFLOW
portefaix/portefaix-hub  https://slsa.dev/provenance/v1  .github/workflows/chart-release-manual.yml@refs/heads/feat/sign
```

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
