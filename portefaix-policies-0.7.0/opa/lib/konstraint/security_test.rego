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

package lib.security

test_added_capabilities_container_match {
	input := {"securityContext": {"capabilities": {"add": ["CAP_SYS_ADMIN"]}}}

	added_capability(input, "CAP_SYS_ADMIN")
}

test_added_capabilities_container_nomatch {
	input := {"securityContext": {"capabilities": {"add": ["CAP_SYS_ADMIN"]}}}

	not added_capability(input, "test")
}

test_added_capabilities_psp_match {
	input := {"spec": {"allowedCapabilities": ["CAP_SYS_ADMIN"]}}

	added_capability(input, "CAP_SYS_ADMIN")
}

test_added_capabilities_psp_nomatch {
	input := {"spec": {"allowedCapabilities": ["CAP_SYS_ADMIN"]}}

	not added_capability(input, "test")
}

test_dropped_capabilities_container_match {
	input := {"securityContext": {"capabilities": {"drop": ["CAP_SYS_ADMIN"]}}}

	dropped_capability(input, "CAP_SYS_ADMIN")
}

test_dropped_capabilities_container_nomatch {
	input := {"securityContext": {"capabilities": {"drop": ["CAP_SYS_ADMIN"]}}}

	not dropped_capability(input, "test")
}

test_dropped_capabilities_psp_match {
	input := {"spec": {"requiredDropCapabilities": ["CAP_SYS_ADMIN"]}}

	dropped_capability(input, "CAP_SYS_ADMIN")
}

test_dropped_capabilities_psp_nomatch {
	input := {"spec": {"requiredDropCapabilities": ["CAP_SYS_ADMIN"]}}

	not dropped_capability(input, "test")
}
