# Change Log

## 0.14.1

**Release date:** 2021-12-10

![AppVersion: 0.22.0](https://img.shields.io/static/v1?label=AppVersion&message=0.22.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Fix sidecar and store graphs in overview dashboard to only match related timeseries

## 0.14.0

**Release date:** 2021-09-01

![AppVersion: 0.22.0](https://img.shields.io/static/v1?label=AppVersion&message=0.22.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: bump to Thanos mixin v0.22.0
- Update: refactoring additonal labels and annotations

### Default value changes

```diff
diff --git charts/thanos-mixin/values.yaml charts/thanos-mixin/values.yaml
index 42d8c24..64c4ee2 100644
--- charts/thanos-mixin/values.yaml
+++ charts/thanos-mixin/values.yaml
@@ -6,11 +6,13 @@
 fullnameOverride: ""
 
 # -- Additional labels to add to the Prometheus rules
-additionalLabels: {}
+additionalLabels: #{}
+  app: thanos
 
 # -- Additional annotations to add to the Prometheus rules
-additionalAnnotations: {}
+additionalAnnotations: #{}
+  role: monitoring
 
 grafana:
-  # Grafana folder in which to store the dashboards
+  # -- Grafana folder in which to store the dashboards
   folder: monitoring
```

## 0.13.0

**Release date:** 2021-06-23

![AppVersion: 0.21.0](https://img.shields.io/static/v1?label=AppVersion&message=0.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Add: Grafana folder and name for Promtail dashboard
- Fix: AppVersion for Chart
- Fix: typo for Helm
- Update: refactoring alerts and rules
- Fix: typo

### Default value changes

```diff
diff --git charts/thanos-mixin/values.yaml charts/thanos-mixin/values.yaml
index 761dfaf..42d8c24 100644
--- charts/thanos-mixin/values.yaml
+++ charts/thanos-mixin/values.yaml
@@ -10,3 +10,7 @@ additionalLabels: {}
 
 # -- Additional annotations to add to the Prometheus rules
 additionalAnnotations: {}
+
+grafana:
+  # Grafana folder in which to store the dashboards
+  folder: monitoring
```

## 0.12.0

**Release date:** 2021-06-18

![AppVersion: 0.20.0](https://img.shields.io/static/v1?label=AppVersion&message=0.20.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Add: Thanos mixin v0.20.0 with Grafana dashboards

### Default value changes

```diff
# No changes in this release
```

## 0.11.1

**Release date:** 2021-04-29

![AppVersion: 0.18.0](https://img.shields.io/static/v1?label=AppVersion&message=0.18.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Fix: duplicate annotations

### Default value changes

```diff
# No changes in this release
```

## 0.11.0

**Release date:** 2021-04-27

![AppVersion: 0.18.0](https://img.shields.io/static/v1?label=AppVersion&message=0.18.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Add: Annotations a8r for Thanos
- Fix: PrometheusRule Thanos alerts name
- Fix: PrometheussRules names for Thanos mixin

### Default value changes

```diff
# No changes in this release
```

## 0.10.0

**Release date:** 2021-04-27

![AppVersion: 0.18.0](https://img.shields.io/static/v1?label=AppVersion&message=0.18.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: charts versions and documentation
- Update: documentation

### Default value changes

```diff
# No changes in this release
```

## 0.9.0

**Release date:** 2021-03-06

![AppVersion: 0.18.0](https://img.shields.io/static/v1?label=AppVersion&message=0.18.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: Chart and application versions
- Update: documentation
- Fix: chart labels
- Fix: chart labels

### Default value changes

```diff
# No changes in this release
```

## 0.8.0

**Release date:** 2021-03-05

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: Thanos Mixin import
- Merge pull request #20 from nlamirault/feature/helm-and-opa
- Update: documentation
- Merge branch 'master' into feature/helm-and-opa

### Default value changes

```diff
# No changes in this release
```

## 0.7.0

**Release date:** 2021-02-28

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: Thanos-mixin chart dependencies
- Update Helm release kube-prometheus-stack to v13.7.0
- Update Helm release kube-prometheus-stack to v13.6.0
- Merge pull request #11 from nlamirault/renovate/helm-kube-prometheus-stack-13.x
- Merge pull request #13 from nlamirault/renovate/helm-thanos-0.x

### Default value changes

```diff
# No changes in this release
```

## 0.6.0

**Release date:** 2021-02-02

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: bump version
- Update Helm release thanos to v0.4.0
- Update Helm release kube-prometheus-stack to v13

### Default value changes

```diff
# No changes in this release
```

## 0.5.0

**Release date:** 2021-01-15

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: Thanos-mixin chart version
- Update: documentation
- Merge pull request #6 from nlamirault/renovate/helm-thanos-0.x
- Update Helm release kube-prometheus-stack to v12.12.1
- Update Helm release thanos to v0.3.31

### Default value changes

```diff
# No changes in this release
```

## 0.4.0

**Release date:** 2020-12-03

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: documentation
- Update: chart documentation
- Fix: typo
- Fix: typo
- Add: CI values
- Fix: notes
- Update: chart dependencies

### Default value changes

```diff
diff --git charts/thanos-mixin/values.yaml charts/thanos-mixin/values.yaml
index ffc3be5..761dfaf 100644
--- charts/thanos-mixin/values.yaml
+++ charts/thanos-mixin/values.yaml
@@ -2,14 +2,11 @@
 # This is a YAML-formatted file.
 # Declare variables to be passed into your templates.
 
-## Provide a name to substitute for the full names of resources
-##
+# -- Provide a name to substitute for the full names of resources
 fullnameOverride: ""
 
-## Additional labels to add to the Prometheus rules
-##
+# -- Additional labels to add to the Prometheus rules
 additionalLabels: {}
 
-## Additional annotations to add to the Prometheus rules
-##
+# -- Additional annotations to add to the Prometheus rules
 additionalAnnotations: {}
```

## 0.3.0

**Release date:** 2020-12-02

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Fix: Chart configuration

### Default value changes

```diff
diff --git charts/thanos-mixin/values.yaml charts/thanos-mixin/values.yaml
index 4c35844..ffc3be5 100644
--- charts/thanos-mixin/values.yaml
+++ charts/thanos-mixin/values.yaml
@@ -12,4 +12,4 @@ additionalLabels: {}
 
 ## Additional annotations to add to the Prometheus rules
 ##
-additionalAnnotations: {}
\ No newline at end of file
+additionalAnnotations: {}
```

## 0.1.0

**Release date:** 2020-12-02

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Update: documentation

### Default value changes

```diff
# No changes in this release
```

## 0.2.0

**Release date:** 2020-12-02

![AppVersion: 0.17.1](https://img.shields.io/static/v1?label=AppVersion&message=0.17.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Add: Thanos mixin chart

### Default value changes

````diff
# Default values for thanos-mixin.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

## Provide a name to substitute for the full names of resources
##
fullnameOverride: ""

## Additional labels to add to the Prometheus rules
##
additionalLabels: {}

## Additional annotations to add to the Prometheus rules
##
additionalAnnotations: {}```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
````
