# Policies

## Violations

* [PORTEFAIX-C0001: Container must not use latest image tag](#portefaix-c0001-container-must-not-use-latest-image-tag)
* [PORTEFAIX-C0002: Container must set liveness probe](#portefaix-c0002-container-must-set-liveness-probe)
* [PORTEFAIX-C0003: Container must set readiness probe](#portefaix-c0003-container-must-set-readiness-probe)
* [PORTEFAIX-C0004: Container must mount secrets as volumes, not enviroment variables](#portefaix-c0004-container-must-mount-secrets-as-volumes,-not-enviroment-variables)
* [PORTEFAIX-C0005: Container must drop all capabilities](#portefaix-c0005-container-must-drop-all-capabilities)
* [PORTEFAIX-C0006: Container must not allow for privilege escalation](#portefaix-c0006-container-must-not-allow-for-privilege-escalation)
* [PORTEFAIX-C0008: Container must define resource contraintes](#portefaix-c0008-container-must-define-resource-contraintes)
* [PORTEFAIX-P0001: Pod must run without access to the host aliases](#portefaix-p0001-pod-must-run-without-access-to-the-host-aliases)
* [PORTEFAIX-P0002: Pod must run without access to the host IPC](#portefaix-p0002-pod-must-run-without-access-to-the-host-ipc)
* [PORTEFAIX-P0003: Pod must run without access to the host networking](#portefaix-p0003-pod-must-run-without-access-to-the-host-networking)
* [PORTEFAIX-P0004: Pod must run as non-root](#portefaix-p0004-pod-must-run-as-non-root)
* [PORTEFAIX-P0005: Pod must run without access to the host PID namespace](#portefaix-p0005-pod-must-run-without-access-to-the-host-pid-namespace)

## Warnings

* [PORTEFAIX-C0007: Container liveness probe and readiness probe should be different](#portefaix-c0007-container-liveness-probe-and-readiness-probe-should-be-different)
* [PORTEFAIX-M0001: Metadata should contain all recommanded Kubernetes labels](#portefaix-m0001-metadata-should-contain-all-recommanded-kubernetes-labels)
* [PORTEFAIX-M0002: Metadata should have a8r.io annotations](#portefaix-m0002-metadata-should-have-a8r.io-annotations)
* [PORTEFAIX-M0003: Metadata should have portefaix.xyz annotations](#portefaix-m0003-metadata-should-have-portefaix.xyz-annotations)

## PORTEFAIX-C0001: Container must not use latest image tag

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

See: https://kubernetes.io/docs/concepts/configuration/overview/#container-images


_source: [opa/C0001-container-image-tag](opa/C0001-container-image-tag)_

## PORTEFAIX-C0002: Container must set liveness probe

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Indicates whether the container is running

See: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes


_source: [opa/C0002-container-liveness-probe](opa/C0002-container-liveness-probe)_

## PORTEFAIX-C0003: Container must set readiness probe

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Indicates whether the container is ready to respond to requests. If you don't set the readiness probe,
the kubelet assumes that the app is ready to receive traffic as soon as the container starts.

See: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes


_source: [opa/C0003-container-readiness-probe](opa/C0003-container-readiness-probe)_

## PORTEFAIX-C0004: Container must mount secrets as volumes, not enviroment variables

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

This is to prevent that the secret values appear in the command that was
used to start the container, which may be inspected by individuals that
shouldn't have access to the secret values.

See: https://learnk8s.io/production-best-practices#application-development


_source: [opa/C0004-container-secret-not-env](opa/C0004-container-secret-not-env)_

## PORTEFAIX-C0005: Container must drop all capabilities

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Granting containers privileged capabilities on the node makes it easier
for containers to escalate their privileges.


_source: [opa/C0005-container-capabilities](opa/C0005-container-capabilities)_

## PORTEFAIX-C0006: Container must not allow for privilege escalation

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Privileged containers can much more easily obtain root on the node.


_source: [opa/C0006-container-escalation](opa/C0006-container-escalation)_

## PORTEFAIX-C0008: Container must define resource contraintes

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Resource constraints on containers ensure that a given workload does not take up more resources than it requires
and potentially starve other applications that need to run.

See: https://kubesec.io/basics/containers-resources-limits-cpu/


_source: [opa/C0008-container-resources](opa/C0008-container-resources)_

## PORTEFAIX-P0001: Pod must run without access to the host aliases

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Pods that can change aliases in the host's /etc/hosts file can
redirect traffic to malicious servers.


_source: [opa/P0001-pod-host-alias](opa/P0001-pod-host-alias)_

## PORTEFAIX-P0002: Pod must run without access to the host IPC

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Pods that are allowed to access the host IPC can read memory of
the other containers, breaking that security boundary.


_source: [opa/P0002-pod-host-ipc](opa/P0002-pod-host-ipc)_

## PORTEFAIX-P0003: Pod must run without access to the host networking

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Pods that can access the host's network interfaces can potentially
access and tamper with traffic the pod should not have access to.


_source: [opa/P0003-pod-host-network](opa/P0003-pod-host-network)_

## PORTEFAIX-P0004: Pod must run as non-root

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Pods running as root (uid of 0) can much more easily escalate privileges
to root on the node. As such, they are not allowed.


_source: [opa/P0004-pod-without-runasnonroot](opa/P0004-pod-without-runasnonroot)_

## PORTEFAIX-P0005: Pod must run without access to the host PID namespace

**Severity:** Violation

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

Pods that can access the host's process tree can view and attempt to
modify processes outside of their namespace, breaking that security
boundary.


_source: [opa/P0005-pod-host-pid](opa/P0005-pod-host-pid)_

## PORTEFAIX-C0007: Container liveness probe and readiness probe should be different

**Severity:** Warning

**Resources:** apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

When Liveness and Readiness probes are pointing to the same endpoint,
the effects of the probes are combined.
When the app signals that it's not ready or live,
the kubelet detaches the container from the Service and delete it at the same time.
See: https://learnk8s.io/production-best-practices#application-development


_source: [opa/C0007-container-same-probes](opa/C0007-container-same-probes)_

## PORTEFAIX-M0001: Metadata should contain all recommanded Kubernetes labels

**Severity:** Warning

**Resources:** Any Resource

See: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels


_source: [opa/M0001-metadata-labels](opa/M0001-metadata-labels)_

## PORTEFAIX-M0002: Metadata should have a8r.io annotations

**Severity:** Warning

**Resources:** Any Resource

See: https://ambassadorlabs.github.io/k8s-for-humans/


_source: [opa/M0002-metadata-annotations](opa/M0002-metadata-annotations)_

## PORTEFAIX-M0003: Metadata should have portefaix.xyz annotations

**Severity:** Warning

**Resources:** Any Resource

Annotations are:
- portefaix.xyz/version


_source: [opa/M0003-metadata-portefaix-annotations](opa/M0003-metadata-portefaix-annotations)_
