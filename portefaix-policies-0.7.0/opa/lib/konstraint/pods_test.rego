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

test_input_as_other {
	input := {
		"kind": "Other",
		"spec": {"containers": [{}]},
	}

	resource := pod with input as input

	not resource
}

test_input_as_pod {
	input := {
		"kind": "Pod",
		"spec": {"containers": [{}]},
	}

	resource := pod with input as input

	resource.spec.containers
}

test_input_as_deployment {
	input := {
		"kind": "Deployment",
		"spec": {"template": {"spec": {"containers": [{}]}}},
	}

	resource := pod with input as input

	resource.spec.containers
}

test_input_as_cronjob {
	input := {
		"kind": "CronJob",
		"spec": {"jobTemplate": {"spec": {"template": {"spec": {"containers": [{}]}}}}},
	}

	resource := pod with input as input

	resource.spec.containers
}

test_containers {
	input := {
		"kind": "Pod",
		"spec": {"containers": [{"name": "container"}]},
	}

	podcontainers := containers with input as input

	podcontainers[_].name == "container"
}

test_volumes {
	input := {
		"kind": "Pod",
		"spec": {"volumes": [{"name": "volume"}]},
	}

	podvolumes := volumes with input as input

	podvolumes[_].name == "volume"
}
