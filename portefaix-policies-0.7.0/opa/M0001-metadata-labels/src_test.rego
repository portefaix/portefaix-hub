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

package k8s_labels

test_metadata_without_labels {
	metadata := {}
	not recommended_labels_provided(metadata)
}

test_metadata_with_labels_false {
	metadata := {
		"name": "test-pod",
		"labels": {"app": "my-app"},
	}

	not recommended_labels_provided(metadata)
}

test_metadata_with_labels_true {
	metadata := {
		"name": "test-pod",
		"labels": {
			"app": "my-app",
			"app.kubernetes.io/name": "portefaix",
			"app.kubernetes.io/instance": "portefaix-app",
			"app.kubernetes.io/version": "v1.0.0",
			"app.kubernetes.io/component": "portefaix-frontend",
			"app.kubernetes.io/part-of": "portefaix",
			"app.kubernetes.io/managed-by": "portefaix",
		},
	}

	recommended_labels_provided(metadata)
}
