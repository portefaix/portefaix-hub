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

# @title Container must not allow for privilege escalation
#
# Privileged containers can much more easily obtain root on the node.
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_escalation

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-C0006"

violation[msg] {
	pods.containers[container]
	container_allows_escalation(container)

	msg := core.format_with_id(sprintf("%s/%s: Allows privilege escalation", [core.kind, core.name]), policyID)
}

container_allows_escalation(c) {
	c.securityContext.allowPrivilegeEscalation == true
}

container_allows_escalation(c) {
	core.missing_field(c.securityContext, "allowPrivilegeEscalation")
}
