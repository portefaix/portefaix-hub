# Portefaix Hub

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/portefaix-hub)](https://artifacthub.io/packages/search?repo=portefaix-hub)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/10860/badge)](https://www.bestpractices.dev/en/projects/10860)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/portefaix/portefaix-hub/badge)](https://securityscorecards.dev/viewer/?uri=github.com/portefaix/portefaix-hub)
[![SLSA 3](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev)

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

### Verify SLSA provenance using the Github CLI

```shell
$ gh attestation verify oci://ghcr.io/portefaix/charts/fake:0.9.2 --repo portefaix/portefaix-hub
Loaded digest sha256:050ae335cba168d6bdd7ebca33c1fb6be6ae34c1af083dd30eab03af5ce58a6e for oci://ghcr.io/portefaix/charts/fake:0.9.2
Loaded 1 attestation from GitHub API
✓ Verification succeeded!

sha256:050ae335cba168d6bdd7ebca33c1fb6be6ae34c1af083dd30eab03af5ce58a6e was attested by:
REPO                     PREDICATE_TYPE                  WORKFLOW
portefaix/portefaix-hub  https://slsa.dev/provenance/v1  .github/workflows/chart-release-manual.yml@refs/heads/master
```

### Verify SLSA provenance using Cosign

```shell
$ cosign verify-attestation \
  --type slsaprovenance \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp '^https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v[0-9]+.[0-9]+.[0-9]+$' \
  ghcr.io/portefaix/charts/fake:0.9.2@sha256:050ae335cba168d6bdd7ebca33c1fb6be6ae34c1af083dd30eab03af5ce58a6e

Verification for ghcr.io/portefaix/charts/fake:0.9.2@sha256:050ae335cba168d6bdd7ebca33c1fb6be6ae34c1af083dd30eab03af5ce58a6e --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The code-signing certificate was verified using trusted certificate authority certificates
Certificate subject: https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/tags/v2.1.0
Certificate issuer URL: https://token.actions.githubusercontent.com
GitHub Workflow Trigger: workflow_dispatch
GitHub Workflow SHA: 46095484119d97f3c91d4325c29d67d07e5fb1ac
GitHub Workflow Name: Charts / Release manual
GitHub Workflow Repository: portefaix/portefaix-hub
GitHub Workflow Ref: refs/heads/master
...
```

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
