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

# @title Container must mount secrets as volumes, not enviroment variables
#
# This is to prevent that the secret values appear in the command that was
# used to start the container, which may be inspected by individuals that
#  shouldn't have access to the secret values.
#
# See: https://learnk8s.io/production-best-practices#application-development
#
# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package container_mount_secrets

import data.lib.core
import data.lib.pods

policyID := "PORTEFAIX-C0004"

violation[msg] {
	pods.containers[container]
	container_mount_secrets(container)
	msg := core.format_with_id(sprintf("%s/%s/%s: Container must mount secrets as volumes, not enviroment variables", [core.kind, core.name, container.name]), policyID)
}

container_mount_secrets(container) {
	env := container.env[_]
	env.valueFrom.secretKeyRef
}
