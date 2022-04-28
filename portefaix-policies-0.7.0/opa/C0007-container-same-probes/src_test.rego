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

package container_same_probes

test_input_as_container_has_differents_probe {
	container := {
		"livenessProbe": {
			"httpGet": {
				"path": "/health",
				"scheme": "HTTP",
				"port": 8181,
			},
			"initialDelaySeconds": 5,
			"periodSeconds": 5,
		},
		"readinessProbe": {
			"httpGet": {
				"path": "/ready",
				"scheme": "HTTP",
				"port": 8181,
			},
			"initialDelaySeconds": 5,
			"periodSeconds": 5,
		},
	}

	not container_same_probe_provided(container)
}

test_input_as_container_has_same_probe {
	container := {
		"livenessProbe": {
			"httpGet": {
				"path": "/health",
				"scheme": "HTTP",
				"port": 8181,
			},
			"initialDelaySeconds": 5,
			"periodSeconds": 5,
		},
		"readinessProbe": {
			"httpGet": {
				"path": "/health",
				"scheme": "HTTP",
				"port": 8181,
			},
			"initialDelaySeconds": 5,
			"periodSeconds": 5,
		},
	}

	container_same_probe_provided(container)
}
