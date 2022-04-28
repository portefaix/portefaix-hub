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

# @title Container must drop all capabilities
#
# Granting containers privileged capabilities on the node makes it easier
# for containers to escalate their privileges.
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_capabilities

import data.lib.core
import data.lib.pods
import data.lib.security

policyID := "PORTEFAIX-C0005"

violation[msg] {
	pods.containers[container]
	not container_dropped_all_capabilities(container)
	msg := core.format_with_id(sprintf("%s/%s/%s: Container must drop all capabilities", [core.kind, core.name, container.name]), policyID)
}

container_dropped_all_capabilities(container) {
	security.dropped_capability(container, "all")
}
