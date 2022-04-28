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

package k8s_annotations

test_metadata_without_annotations {
	metadata := {}
	not recommended_annotations_provided(metadata)
}

test_metadata_with_annotations_false {
	metadata := {
		"name": "test-pod",
		"annotations": {"app": "my-app"},
	}

	not recommended_annotations_provided(metadata)
}

test_metadata_with_annotations_true {
	metadata := {
		"name": "test-pod",
		"annotations": {
			"app": "my-app",
			"a8r.io/description": "The foo project",
			"a8r.io/owner": "portefaix",
			"a8r.io/bugs": "https://github.com/portefaix/portefaix-policies/issues",
			"a8r.io/documentation": "https://github.com/portefaix/portefaix-policies",
			"a8r.io/repository": "https://github.com/portefaix/portefaix-policies",
			"a8r.io/support": "https://github.com/portefaix/portefaix-policies/issues",
		},
	}

	recommended_annotations_provided(metadata)
}
