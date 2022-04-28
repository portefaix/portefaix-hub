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

# @title Pod must run without access to the host PID namespace
#
# Pods that can access the host's process tree can view and attempt to
# modify processes outside of their namespace, breaking that security
# boundary.
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package pod_host_pid

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-P0005"

violation[msg] {
	pods.pod[pod]
	pod_host_pid(pod)
	msg := core.format_with_id(sprintf("%s/%s: Pods must run without access to the host PID namespace", [core.kind, core.name]), policyID)
}

pod_host_pid(pod) {
	pod.spec.hostPID
}
