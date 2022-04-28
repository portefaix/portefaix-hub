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

package container_image_tag

test_input_as_image_without_latest_tag {
	input := {
		"name": "test",
		"image": "image:v1.0.0",
	}

	not has_latest_tag(input)
}

test_input_as_image_with_latest_tag {
	input := {
		"name": "test",
		"image": "image:latest",
	}

	has_latest_tag(input)
}

test_input_as_image_with_no_tag {
	input := {
		"name": "test",
		"image": "image",
	}

	has_latest_tag(input)
}
