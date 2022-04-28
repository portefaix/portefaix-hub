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

# @title Pod must run without access to the host aliases
#
# Pods that can change aliases in the host's /etc/hosts file can
# redirect traffic to malicious servers.
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package pod_host_alias

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-P0001"

violation[msg] {
	pods.pod[pod]
	pod_host_alias(pod)
	msg := core.format_with_id(sprintf("%s/%s: Pod must not have hostAliases", [core.kind, core.name]), policyID)
}

pod_host_alias(pod) {
	pod.spec.hostAliases
}
