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

# @title Container must define resource contraintes
#
# Resource constraints on containers ensure that a given workload does not take up more resources than it requires
# and potentially starve other applications that need to run.
#
# See: https://kubesec.io/basics/containers-resources-limits-cpu/
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_resource_constraints

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-C0008"

violation[msg] {
	pods.containers[container]
	not container_resources_provided(container)
	msg := core.format_with_id(sprintf("%s/%s/%s: Container resource constraints must be specified", [core.kind, core.name, container.name]), policyID)
}

container_resources_provided(container) {
	container.resources.requests.cpu
	container.resources.requests.memory
	container.resources.limits.cpu
	container.resources.limits.memory
}
