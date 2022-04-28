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

dropped_capability(container, cap) {
	lower(container.securityContext.capabilities.drop[_]) == lower(cap)
}

dropped_capability(psp, cap) {
	lower(psp.spec.requiredDropCapabilities[_]) == lower(cap)
}

added_capability(container, cap) {
	lower(container.securityContext.capabilities.add[_]) == lower(cap)
}

added_capability(psp, cap) {
	lower(psp.spec.allowedCapabilities[_]) == lower(cap)
}

added_capability(psp, cap) {
	lower(psp.spec.defaultAddCapabilities[_]) == lower(cap)
}
