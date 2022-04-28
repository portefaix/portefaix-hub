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

package lib.rbac

test_rule_has_verb_with_use {
	input := {"verbs": ["use"]}

	rule_has_verb(input, "use")
}

test_rule_has_verb_with_asterisk {
	input := {"verbs": ["*"]}

	rule_has_verb(input, "use")
}

test_rule_has_verb_with_list {
	input := {"verbs": ["list"]}

	not rule_has_verb(input, "use")
}

test_rule_has_resource_type_with_pod {
	input := {"resources": ["Pod"]}

	rule_has_resource_type(input, "pod")
}

test_rule_has_resource_type_with_resourceall {
	input := {"resources": ["*"]}

	rule_has_resource_type(input, "pod")
}

test_rule_has_resource_type_with_container {
	input := {"resources": ["Container"]}

	not rule_has_resource_type(input, "pod")
}

test_rule_has_resource_name_match {
	input := {"resourceNames": ["test"]}

	rule_has_resource_name(input, "test")
}

test_rule_has_resource_name_no_match {
	input := {"resourceNames": ["test"]}

	not rule_has_resource_name(input, "wrong")
}

test_rule_has_resource_name_null {
	input := {}

	rule_has_resource_name(input, "wrong")
}
