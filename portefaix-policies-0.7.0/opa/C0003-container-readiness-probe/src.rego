# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# @title Container must set readiness probe
#
# Indicates whether the container is ready to respond to requests. If you don't set the readiness probe,
# the kubelet assumes that the app is ready to receive traffic as soon as the container starts.
#
# See: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_readiness_probe

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-C0003"

violation[msg] {
	pods.containers[container]
	not container_liveness_probe_provided(container)
	msg := core.format_with_id(sprintf("%s/%s/%s: Container readiness probe be specified", [core.kind, core.name, container.name]), policyID)
}

container_liveness_probe_provided(container) {
	core.has_field(container, "readinessProbe")
}
