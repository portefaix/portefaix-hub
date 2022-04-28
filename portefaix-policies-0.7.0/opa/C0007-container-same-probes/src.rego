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

# @title Container liveness probe and readiness probe should be different
#
# When Liveness and Readiness probes are pointing to the same endpoint,
# the effects of the probes are combined.
# When the app signals that it's not ready or live,
# the kubelet detaches the container from the Service and delete it at the same time.

# See: https://learnk8s.io/production-best-practices#application-development
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_same_probes

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-C0007"

warn[msg] {
	pods.containers[container]
	not container_same_probe_provided(container)
	msg := core.format_with_id(sprintf("%s/%s/%s: Container liveness probe and readiness probe should be different", [core.kind, core.name, container.name]), policyID)
}

container_same_probe_provided(container) {
	container.livenessProbe
	container.readinessProbe
	container.livenessProbe == container.readinessProbe
}
