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

package container_resource_constraints

test_input_as_container_missing_resources {
	container := {}
	not container_resources_provided(container)
}

test_input_as_container_with_missing_memory_requests {
	container := {"resources": {"requests": {"cpu": "1"}}}

	not container_resources_provided(container)
}

test_input_as_container_with_missing_limits_constraint {
	container := {"resources": {"requests": {
		"cpu": "1",
		"memory": "1",
	}}}

	not container_resources_provided(container)
}

test_input_as_container_with_all_constraints {
	container := {"resources": {
		"requests": {
			"cpu": "1",
			"memory": "1",
		},
		"limits": {
			"cpu": "1",
			"memory": "1",
		},
	}}

	container_resources_provided(container)
}
