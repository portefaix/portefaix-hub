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

package lib.psps

import data.lib.core

# PodSecurityPolicies are not namespace scoped, so the default PSPs included
# in managed Kubernetes offerings cannot be excluded using the normal
# methods in Gatekeeper.
is_exception {
	exceptions := {
		"gce.privileged", # GKE
		"gce.persistent-volume-binder", # GKE
		"gce.event-exporter", # GKE
		"gce.gke-metrics-agent", # GKE
		"gce.unprivileged-addon", # GKE
		"gce.fluentd-gke", # GKE
		"gce.fluentd-gcp", # GKE
	}

	core.name == exceptions[_]
}

psps[psp] {
	lower(core.kind) = "podsecuritypolicy"
	not is_exception
	psp = core.resource
}
