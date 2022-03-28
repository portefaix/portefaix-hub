# Change Log

## 0.9.0 

**Release date:** 2021-08-31

![AppVersion: 2.3.0](https://img.shields.io/static/v1?label=AppVersion&message=2.3.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Update: how check PrometheusRule and configmap 

### Default value changes

```diff
# No changes in this release
```

## 0.8.0 

**Release date:** 2021-06-23

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Grafana folder and name for Promtail dashboard 
* Merge branch 'master' into feat/loki-promtail-logos 

### Default value changes

```diff
diff --git charts/promtail-mixin/values.yaml charts/promtail-mixin/values.yaml
index e0ff1d5..435483d 100644
--- charts/promtail-mixin/values.yaml
+++ charts/promtail-mixin/values.yaml
@@ -10,3 +10,7 @@ additionalLabels: {}
 
 # -- Additional annotations to add to the Prometheus rules
 additionalAnnotations: {}
+
+grafana:
+  # Grafana folder in which to store the dashboards
+  folder: logging
```

## 0.7.0 

**Release date:** 2021-06-23

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: changelog 

### Default value changes

```diff
# No changes in this release
```

## 0.6.0 

**Release date:** 2021-06-18

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Promtail mixin with dashboards 

### Default value changes

```diff
# No changes in this release
```

## 0.5.1 

**Release date:** 2021-06-18

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Loki and Promtail logos 

### Default value changes

```diff
# No changes in this release
```

## 0.5.0 

**Release date:** 2021-06-18

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Promtail mixin with dashboards 

### Default value changes

```diff
# No changes in this release
```

## 0.4.1 

**Release date:** 2021-04-29

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Fix: duplicate annotations 

### Default value changes

```diff
# No changes in this release
```

## 0.4.0 

**Release date:** 2021-04-27

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Annotations a8r for Promtail 
* Fix: PrometheusRule Promtail alerts and rules name 

### Default value changes

```diff
# No changes in this release
```

## 0.3.0 

**Release date:** 2021-04-27

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Update: charts versions and documentation 
* Update: documentation 

### Default value changes

```diff
# No changes in this release
```

## 0.2.0 

**Release date:** 2021-03-13

![AppVersion: 2.2.0](https://img.shields.io/static/v1?label=AppVersion&message=2.2.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Update: bump Loki and Promtail to v2.2.0 

### Default value changes

```diff
# No changes in this release
```

## 0.1.0 

**Release date:** 2021-03-06

![AppVersion: 2.1.0](https://img.shields.io/static/v1?label=AppVersion&message=2.1.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add: Promtail mixin v2.1.0 

### Default value changes

```diff
# Default values for promtail-mixin.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

# -- Provide a name to substitute for the full names of resources
fullnameOverride: ""

# -- Additional labels to add to the Prometheus rules
additionalLabels: {}

# -- Additional annotations to add to the Prometheus rules
additionalAnnotations: {}
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)