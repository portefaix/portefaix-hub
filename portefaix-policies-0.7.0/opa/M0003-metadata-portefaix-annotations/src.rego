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

# @title Metadata should have portefaix.xyz annotations
#
# Annotations are:
# - portefaix.xyz/version

package k8s_annotations_portefaix

import data.lib.core # as konstraint_core

policyID := "PORTEFAIX-M0003"

warn[msg] {
	not recommended_portefaix_annotations_provided(core.resource.metadata)
	msg = core.format_with_id(sprintf("%s/%s: should have all the expected portefaix.xyz annotations", [core.kind, core.name]), policyID)
}

recommended_portefaix_annotations_provided(metadata) {
	metadata.annotations["portefaix.xyz/version"]
}
