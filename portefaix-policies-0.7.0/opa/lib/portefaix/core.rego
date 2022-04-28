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

# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

package lib.portefaix.core

import data.lib.core as konstraint_core

name = input.metadata.name

kind = input.kind

is_deployment {
	lower(konstraint_core.apiVersion) == "apps/v1"
	lower(konstraint_core.kind) == "deployment"
}

is_service {
	lower(konstraint_core.apiVersion) == "v1"
	lower(konstraint_core.kind) == "service"
}

is_pod {
	lower(konstraint_core.kind) == "pod"
}

is_statefulset {
	lower(konstraint_core.kind) == "statefulset"
}

is_daemonset {
	lower(konstraint_core.kind) == "daemonSet"
}

is_replicaset {
	lower(konstraint_core.kind) == "replicaset"
}

is_configmap {
	lower(konstraint_core.kind) == "configmap"
}

is_secret {
	lower(konstraint_core.kind) == "secret"
}

is_service_account {
	lower(konstraint_core.kind) == "serviceAccount"
}

is_role {
	lower(konstraint_core.kind) == "role"
}

is_rolebinding {
	lower(konstraint_core.apiVersion) == "rbac.authorization.k8s.io/v1"
	lower(konstraint_core.kind) == "rolebinding"
}

is_cluster_role {
	lower(konstraint_core.kind) == "clusterRole"
}

is_cluster_role_binding {
	# kind = "ClusterRoleBinding"
	lower(konstraint_core.apiVersion) == "rbac.authorization.k8s.io/v1"
	lower(konstraint_core.kind) == "clusterrolebinding"
}
