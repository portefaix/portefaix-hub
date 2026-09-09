---
name: helm-values-schema
description: Keep values.schema.json in sync with values.yaml for Helm charts — schema annotations, regeneration, and helm-docs comment ordering.
---

# /helm-values-schema [chart]

Use this skill when the user asks to add, change, review, or regenerate a Helm chart
`values.schema.json`, or when a chart feature changes `values.yaml`.

## Detection

Charts live at `charts/<chart>/`. Check which schema flow the chart uses:

1. **Annotation-driven** (tooling: `helm-values-schema-json`): `charts/<chart>/values.yaml`
   contains `# @schema` comments and/or a top-level reference such as
   `# $schema: ./values.schema.json`. Schema annotations and
   `values.schema.json` must be kept in sync.
2. **Plain schema file** (current state of most charts in this repo):
   `charts/<chart>/values.schema.json` exists with no `# @schema` annotations in
   `values.yaml`. The schema must be updated by hand to match `values.yaml`.

Check the existing schema's `$schema` dialect (e.g. `draft/2020-12`) and stay
consistent with it within the same file.

Upstream plugin docs (only relevant for flow 1):

```text
https://github.com/losisin/helm-values-schema-json/blob/main/docs/README.md
```

## Workflow

1. Read `charts/<chart>/values.yaml` and `charts/<chart>/values.schema.json`.
2. Determine the flow from Detection above.
3. If changing or adding values:
   - Flow 1: preserve nearby `# @schema` annotations; add annotations when the
     inferred schema would be wrong or too loose. Then regenerate the schema
     (see Commands) — never hand-edit the generated file.
   - Flow 2: update `values.schema.json` by hand — add/remove properties to
     match `values.yaml`, with correct `type`, `required`, `default`, and
     constraints.
4. Preserve helm-docs comments (`# --`). Descriptions in the schema should match
   the helm-docs descriptions in `values.yaml`.
5. Review the schema diff: only intentional changes.
6. Validate the chart still lints and renders
   (`make helm-lint CHART=charts/<chart>`, `make helm-template CHART=charts/<chart>`).

## helm-docs Interaction

This repo documents values with helm-docs `# --` comments. Keep schema
`description` fields aligned with those comments.

If the chart adopts `# @schema` annotations (flow 1), ordering matters:
helm-docs does not understand `# @schema` comments and will include them in the
generated description if they sit between the `# --` comment and the value.
Put `# @schema` comments **above** helm-docs `# --` comments.

Good:

```yaml
# @schema maxLength:10
# -- My awesome nameOverride description
nameOverride: "myapp"
```

Bad (schema annotation leaks into helm-docs description):

```yaml
# -- My awesome nameOverride description
# @schema maxLength:10
nameOverride: "myapp"
```

The schema plugin additionally does not support helm-docs-specific properties
such as `# @default --` / `# @section --`, nor detached helm-docs comments
(a blank line between comment and value). Comments must be directly above the
property or inline.

## Annotation Placement (flow 1 only)

`# @schema` annotations may be placed inline, on the line above a field, or in
specific cases below a block. Preserve the surrounding style already used in
the chart, except when it conflicts with the helm-docs ordering above.

```yaml
fullnameOverride: "myapp" # @schema maxLength:10;pattern:^[a-z]+$

# @schema maxLength:10;pattern:^[a-z]+$
nameOverride: "myapp"

resources:
  limits: {}
  requests: {}
# @schema additionalProperties:false
```

Multiple schema annotations can be separated with semicolons.

## Commands

This repo has no `helm-schema` make target and the `helm schema` plugin is not
installed by default. For flow 1, run the plugin directly from the repo root:

```bash
helm schema -f charts/<chart>/values.yaml -o charts/<chart>/values.schema.json
```

Add `--use-helm-docs` only when the chart wants descriptions sourced from
helm-docs comments (supported by the plugin since v2.0.0):

```bash
helm schema --use-helm-docs -f charts/<chart>/values.yaml -o charts/<chart>/values.schema.json
```

If schema generation becomes routine, add a `helm-schema` target to `Makefile`
following the existing `helm-doc` / `helm-lint` pattern instead of inventing
one-off commands.

## Rules

- Do not hand-edit `values.schema.json` when it can be regenerated (flow 1).
- Do not remove existing `# @schema` annotations unless the associated value
  is removed.
- Keep schema annotations as close as possible to the value they describe.
- Keep `# @schema` comments above helm-docs `# --` comments, never between the
  helm-docs comment and the value.
- Include the updated `values.schema.json` in the same change as `values.yaml`.
- Keep the JSON Schema dialect consistent with the existing schema file.
  (Helm itself validates against draft-07 semantics — avoid constructs outside it.)
