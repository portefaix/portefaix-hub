# Copyright (C) 2020-2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

package main

import data.lib.kubernetes

name = input.metadata.name

recommended_labels {
    input.metadata.labels["app.kubernetes.io/name"]
    input.metadata.labels["app.kubernetes.io/instance"]
    input.metadata.labels["app.kubernetes.io/version"]
    input.metadata.labels["app.kubernetes.io/component"]
    input.metadata.labels["app.kubernetes.io/part-of"]
    input.metadata.labels["app.kubernetes.io/managed-by"]
}

# deny[msg] {
#   input.kind = "Deployment"
#   not recommendedLabels
#   msg = "Containers must provide app label for pod selectors"
# }

warn[msg] {
  kubernetes.is_deployment
  not recommended_labels
  msg = sprintf("Deployment %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_statefulset
  not recommended_labels
  msg = sprintf("Statefulset %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_daemonset
  not recommended_labels
  msg = sprintf("Daemonset %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_pod
  not recommended_labels
  msg = sprintf("Pod %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_replicaset
  not recommended_labels
  msg = sprintf("ReplicaSet %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_service
  not recommended_labels
  msg = sprintf("Service %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_configmap
  not recommended_labels
  msg = sprintf("ConfigMap %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_secret
  not recommended_labels
  msg = sprintf("Secret %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_service_account
  not recommended_labels
  msg = sprintf("ServiceAccount %s must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels", [kubernetes.name])
}
