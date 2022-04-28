# Policies

## medium
* [PORTEFAIX-C0001 - Container must not use latest image tag](#portefaix-c0001)
* [PORTEFAIX-C0002 - Container must set liveness probe](#portefaix-c0002)
* [PORTEFAIX-C0003 - Container must set readiness probe](#portefaix-c0003)
* [PORTEFAIX-C0004 - Container must mount secrets as volumes, not enviroment variables](#portefaix-c0004)
* [PORTEFAIX-C0005 - Container must drop all capabilities](#portefaix-c0005)
* [PORTEFAIX-C0006 - Container must not allow for privilege escalation](#portefaix-c0006)
* [PORTEFAIX-C0008 - Container resource constraints must be specified](#portefaix-c0008)

## low
* [PORTEFAIX-M0001 - Metadata must set recommanded Kubernetes labels](#portefaix-m0001)
* [PORTEFAIX-M0002 - Metadata should have a8r.io annotations](#portefaix-m0002)
* [PORTEFAIX-M0003 - Metadata should have portefaix.xyz annotations](#portefaix-m0003)

## high
* [PORTEFAIX-P0002 - Pod must run without access to the host IPC](#portefaix-p0002)
* [PORTEFAIX-P0003 - Pod must run without access to the host networking](#portefaix-p0003)
* [PORTEFAIX-P0004 - Pod must run as non-root](#portefaix-p0004)
* [PORTEFAIX-P0005 - Pod must run without access to the host PID](#portefaix-p0005)

## PORTEFAIX-P0002 - Pod must run without access to the host IPC

**Category:** Best Practices

**Severity:** high

**Description:** Pods that are allowed to access the host IPC can read memory of the other containers, breaking that security boundary.

## PORTEFAIX-P0003 - Pod must run without access to the host networking

**Category:** Best Practices

**Severity:** high

**Description:** Sharing the host’s network namespace permits processes in the pod to communicate with processes bound to the host’s loopback adapter

## PORTEFAIX-P0004 - Pod must run as non-root

**Category:** Best Practices

**Severity:** high

**Description:** Force the running image to run as a non-root user to ensure least privilege

## PORTEFAIX-P0005 - Pod must run without access to the host PID

**Category:** Best Practices

**Severity:** high

**Description:** Sharing the host’s PID namespace allows visibility of processes on the host, potentially leaking information such as environment variables and configuration

## PORTEFAIX-C0001 - Container must not use latest image tag

**Category:** Best Practices

**Severity:** medium

**Description:** The ':latest' tag is mutable and can lead to unexpected errors if the image changes. A best practice is to use an immutable tag that maps to a specific version of an application pod.

## PORTEFAIX-C0002 - Container must set liveness probe

**Category:** Best Practices

**Severity:** medium

**Description:** Liveness probe need to be configured to correctly manage a pods lifecycle during deployments, restarts, and upgrades. For each pod, a periodic `livenessProbe` is performed by the kubelet to determine if the pod's containers are running or need to be restarted

## PORTEFAIX-C0003 - Container must set readiness probe

**Category:** Best Practices

**Severity:** medium

**Description:** Readiness probe need to be configured to correctly manage a pods lifecycle during deployments, restarts, and upgrades. For each pod, a `readinessProbe` is used by services and deployments to determine if the pod is ready to receive network traffic.

## PORTEFAIX-C0004 - Container must mount secrets as volumes, not enviroment variables

**Category:** BestPractices

**Severity:** medium

**Description:** Disallow using secrets from environment variables which are visible in resource definitions.

## PORTEFAIX-C0005 - Container must drop all capabilities

**Category:** BestPractices

**Severity:** medium

**Description:** Capabilities permit privileged actions without giving full root access. All capabilities should be dropped from a pod, with only those required added back.

## PORTEFAIX-C0006 - Container must not allow for privilege escalation

**Category:** BestPractices

**Severity:** medium

**Description:** Privilege escalation, such as via set-user-ID or set-group-ID file mode, should not be allowed.

## PORTEFAIX-C0008 - Container resource constraints must be specified

**Category:** BestPractices

**Severity:** medium

**Description:** It is important to limit resources requested and consumed by each pod.

## PORTEFAIX-M0001 - Metadata must set recommanded Kubernetes labels

**Category:** Best Practices

**Severity:** low

**Description:** Metadata must set recommanded Kubernetes labels See: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels

## PORTEFAIX-M0002 - Metadata should have a8r.io annotations

**Category:** Best Practices

**Severity:** low

**Description:** Metadata should have all the expected a8r.io annotations See: https://ambassadorlabs.github.io/k8s-for-humans/

## PORTEFAIX-M0003 - Metadata should have portefaix.xyz annotations

**Category:** Best Practices

**Severity:** low

**Description:** Metadata should have Portefaix annotations
