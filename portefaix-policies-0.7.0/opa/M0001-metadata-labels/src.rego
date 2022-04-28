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

# @title Metadata should contain all recommanded Kubernetes labels
#
# See: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels

package k8s_labels

import data.lib.core # as konstraint_core

policyID := "PORTEFAIX-M0001"

warn[msg] {
	not recommended_labels_provided(core.resource.metadata)
	msg = core.format_with_id(sprintf("%s/%s: should contain all recommanded Kubernetes labels", [core.kind, core.name]), policyID)
}

recommended_labels_provided(metadata) {
	metadata.labels["app.kubernetes.io/name"]
	metadata.labels["app.kubernetes.io/instance"]
	metadata.labels["app.kubernetes.io/version"]
	metadata.labels["app.kubernetes.io/component"]
	metadata.labels["app.kubernetes.io/part-of"]
	metadata.labels["app.kubernetes.io/managed-by"]
}
