---
name: helm-chart-test
description: Test a Helm chart change — lint, render, chart-testing, and policy checks. Discovers chart structure, maps coverage gaps, and validates rendered manifests.
---

# /helm-chart-test [chart]

Use this skill whenever the user asks to add, expand, fix, or review test
coverage for a chart, or when a chart feature change needs validation of the
rendered manifests.

> Note: this repo does **not** use helm-unittest (`charts/*/tests/`,
> `make helm-unittest` do not exist here). The standard validation stack is
> `helm lint` + `helm template` + `chart-testing` (`ct lint`, `ct install`) +
> `conftest` policies. A short opt-in section at the end covers helm-unittest
> conventions if it is ever adopted.

## Argument Handling

**During feature implementation**, infer the chart from the files being changed
(`charts/<chart>/...`) or from the requested feature. Validate the affected
rendered behavior without pausing for broad coverage analysis, unless the
requested behavior is ambiguous.

**If no chart can be inferred**, ask the user which chart they want to work on.

**If `<chart>` is provided for a standalone audit**, run the discovery and
coverage analysis below, then report before running anything destructive.

## Discovery and Coverage Analysis

Work through these steps silently. Produce a single structured report at the end.

### 1. Understand the chart structure

- Read `charts/<chart>/Chart.yaml` (type, version, kubeVersion, dependencies).
- Read `charts/<chart>/values.yaml` (major configuration axes, enable flags).
- List `charts/<chart>/templates/`.
- Check for `charts/<chart>/ci/test-values.yaml` (custom values used by
  `helm-template-custom` / `helm-lint-custom`).
- Check for `charts/<chart>/values.schema.json` (value constraints the
  templates can rely on).
- Read `_helpers.tpl` before validating templates that call helpers.

### 2. Map existing validation

- Custom-values coverage: does `ci/test-values.yaml` exercise the chart's main
  branches, or only defaults?
- Policy coverage: are there `conftest` policies applicable to this chart's
  resource kinds?
- Note branches with no coverage: `if` / `with` / `range` blocks, deployment
  modes, `.Capabilities` guards, `lookup` calls, subchart values.

### 3. Present the coverage report

```md
## <chart> - Test Coverage Analysis

| Area | Status |
|---|---|
| helm lint (defaults) | Covered / Missing |
| helm lint (ci/test-values.yaml) | Covered / Missing / No custom values file |
| helm template render check | Covered / Missing |
| ct lint | Runs in CI |
| conftest policy check | Covered / Missing |
| Uncovered branches | <list of significant unrendered conditionals> |

### Suggested starting point
<lowest-risk, highest-value validation to add and why>
```

## Validation Workflow

For the chart touched by a change, in order:

1. **Lint with defaults**: `make helm-lint CHART=charts/<chart>`
2. **Lint with custom values** (if `ci/test-values.yaml` exists):
   `make helm-lint-custom CHART=charts/<chart>`
3. **Render with defaults** and inspect the affected resources:
   `make helm-template CHART=charts/<chart>`
4. **Render with custom values**:
   `make helm-template-custom CHART=charts/<chart>`
5. **Targeted render diff** for the feature: render before/after and confirm
   only intended resources change, e.g.
   `helm template charts/<chart> --values charts/<chart>/ci/test-values.yaml`
   with the feature values toggled on/off.
6. **Policy check** when the change affects security/shape-sensitive resources:
   `make helm-policy CHART=charts/<chart> POLICY=<policy-dir>`
7. **Schema check** when `values.yaml` changed: see the `helm-values-schema`
   skill — keep `values.schema.json` in sync.
8. **Docs check** when values changed: `make helm-doc CHART=charts/<chart>`
   and include the regenerated README table.

`ct lint` and `ct install` (kind-based install test) run in CI
(`.github/workflows/chart-test.yml`, config `.github/ct.yaml`). Do not run
`ct install` or `kind` clusters locally unless the user asks — prefer
`helm template` for fast iteration.

## Commands

All from the repo root; `CHART` is the chart path, not just the name.

```bash
make helm-lint CHART=charts/<chart>
make helm-lint-custom CHART=charts/<chart>
make helm-template CHART=charts/<chart>
make helm-template-custom CHART=charts/<chart>
make helm-policy CHART=charts/<chart> POLICY=<policy-dir>
make helm-doc CHART=charts/<chart>
```

## Writing New Validation

When adding lasting validation for a feature:

1. Read the template being changed — every conditional, value reference,
   helper call, and document emitted.
2. Prefer extending `charts/<chart>/ci/test-values.yaml` with the new values
   so `helm-lint-custom` / `helm-template-custom` / CI cover them.
3. For conditional rendering, verify both branches render as expected
   (enabled/disabled, with/without optional blocks) via targeted
   `helm template --set <flag>=...` invocations.
4. For value propagation (labels, annotations, selectors, image, resources),
   render and assert on the exact field paths with `yq` or by inspecting the
   template output — one behavior per check.
5. Re-run lint + template after each fix until both pass.

## Opt-in: helm-unittest (not currently used)

If the repo ever adopts helm-unittest, follow these conventions so tests stay
consistent:

- Tests are YAML files under `charts/<chart>/tests/`, mirroring the
  `templates/` directory structure; filenames end with `_test.yaml`.
- Each `tests[].it` case renders independently — one behavior per test, explicit
  value overrides, scoped assertions.
- Use `RELEASE-NAME` as the default release name in assertions.
- Prefer `documentSelector` over hardcoded `documentIndex` for multi-document
  templates.
- Set deployment-mode-style flags explicitly; never rely on defaults when the
  chart has conditional rendering modes.
- Use `kubernetesProvider` fixtures whenever templates call `lookup`
  (without it, `lookup` returns empty and branch coverage is incomplete).
- Add a `helm-unittest` make target following the existing `helm-lint` pattern
  instead of one-off commands.

## Rules

- Only touch the chart(s) in scope. Do not modify other charts, `Chart.yaml`
  versions, or CI config unless the user explicitly expands the scope.
- Never run destructive commands (cluster deletes, installs to shared
  clusters). Local validation is `helm lint` / `helm template`; kind-based
  install tests belong to CI unless requested.
- Always set mode/enable flags explicitly when rendering conditional charts —
  do not rely on defaults to exercise branches.
- When `values.yaml` changes, keep `values.schema.json`, `ci/test-values.yaml`,
  and helm-docs README output in sync in the same change.
- Re-run the relevant lint + template commands after writing or fixing
  validation, and report their results.
