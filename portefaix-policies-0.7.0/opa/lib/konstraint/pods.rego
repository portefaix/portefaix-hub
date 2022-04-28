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

package lib.pods

import data.lib.core

default pod = false

pod = core.resource.spec.template {
	pod_templates := ["daemonset", "deployment", "job", "replicaset", "replicationcontroller", "statefulset"]
	lower(core.kind) == pod_templates[_]
}

pod = core.resource {
	lower(core.kind) == "pod"
}

pod = core.resource.spec.jobTemplate.spec.template {
	lower(core.kind) == "cronjob"
}

containers[container] {
	keys = {"containers", "initContainers"}
	all_containers = [c | keys[k]; c = pod.spec[k][_]]
	container = all_containers[_]
}

volumes[volume] {
	volume = pod.spec.volumes[_]
}
