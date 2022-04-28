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

default is_gatekeeper = false

is_gatekeeper {
	has_field(input, "review")
	has_field(input.review, "object")
}

resource = input.review.object {
	is_gatekeeper
}

resource = input {
	not is_gatekeeper
}

format(msg) = {"msg": msg}

format_with_id(msg, id) = msg_fmt {
	msg_fmt := {
		"msg": sprintf("%s: %s", [id, msg]),
		"details": {"policyID": id},
	}
}

apiVersion = resource.apiVersion

name = resource.metadata.name

kind = resource.kind

labels = resource.metadata.labels

annotations = resource.metadata.annotations

gv := split(apiVersion, "/")

group = gv[0] {
	contains(apiVersion, "/")
}

group = "core" {
	not contains(apiVersion, "/")
}

version := gv[minus(count(gv), 1)]

has_field(obj, field) {
	not object.get(obj, field, "N_DEFINED") == "N_DEFINED"
}

missing_field(obj, field) {
	obj[field] == ""
}

missing_field(obj, field) {
	not has_field(obj, field)
}
