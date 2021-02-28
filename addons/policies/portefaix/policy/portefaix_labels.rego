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
import data.lib.prometheus_operator_crds


name = input.metadata.name

portefaix_labels {
  input.metadata.labels["app"]
  # input.metadata.labels["app.kubernetes.io/manufacturer"]
}

warn[msg] {
  kubernetes.is_deployment
  not portefaix_labels
  msg = sprintf("Deployment %s could include Portefaix recommended labels: https://portefaix.xyz/docs/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_statefulset
  not portefaix_labels
  msg = sprintf("Statefulset %s could include Portefaix recommended labels: https://portefaix.xyz/docs/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_daemonset
  not portefaix_labels
  msg = sprintf("Daemonset %s could include Portefaix recommended labels: https://portefaix.xyz/docs/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_pod
  not portefaix_labels
  msg = sprintf("Pod %s could include Portefaix recommended labels: https://portefaix.xyz/docs/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_replicaset
  not portefaix_labels
  msg = sprintf("ReplicaSet %s could include Portefaix recommended labels: https://portefaix.xyz/docs/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_service
  not portefaix_labels
  msg = sprintf("Service %s must include Portefaix recommended labels: https://portefaix.xyz/docs/books/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_configmap
  not portefaix_labels
  msg = sprintf("ConfigMap %s must include Portefaix recommended labels: https://portefaix.xyz/docs/books/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_secret
  not portefaix_labels
  msg = sprintf("Secret %s must include Portefaix recommended labels: https://portefaix.xyz/docs/books/kubernetes", [kubernetes.name])
}

warn[msg] {
  kubernetes.is_service_account
  not portefaix_labels
  msg = sprintf("ServiceAccount %s must include Portefaix recommended labels: https://portefaix.xyz/docs/books/kubernetes", [kubernetes.name])
}

warn[msg] {
  prometheus_operator_crds.is_prometheus_rule
  not portefaix_labels
  msg = sprintf("PrometheusRule %s must include Portefaix recommended labels: https://portefaix.xyz/docs/books/kubernetes", [kubernetes.name])
}
