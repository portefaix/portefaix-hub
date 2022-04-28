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

package lib.core

test_not_gk {
	input := {"kind": "test"}
	not is_gatekeeper with input as input
}

test_is_gk {
	input := {"review": {"object": {"kind": "test"}}}
	is_gatekeeper with input as input
}

test_has_field_pos {
	input := {"kind": "test"}
	has_field(input, "kind")
}

test_missing_field {
	input := {"kind": "test"}
	not has_field(input, "abc")
}
