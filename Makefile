# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
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
#
# SPDX-License-Identifier: Apache-2.0

include hack/commons.mk

CLUSTER = portefaix-hub-local
KUBE_CONTEXT = kind-portefaix-hub-local


# ====================================
# D E V E L O P M E N T
# ====================================

##@ Development

.PHONY: clean
clean: ## Cleanup
	@echo -e "$(OK_COLOR)[$(BANNER)] Cleanup$(NO_COLOR)"
	@find . -name "*.retry"|xargs rm -f

.PHONY: check
check: check-poetry check-helm ## Check requirements

.PHONY: init
init: ## Initialize environment
	poetry install
	$(VENV)/bin/pre-commit install

.PHONY: validate
validate: ## Execute git-hooks
	@pre-commit run -a

.PHONY: mixins
mixins: guard-CHART guard-LOG guard-RELEASE ## Install mixins
	$(VENV)/bin/python3 ./hack/mixins.py $(CHART) --release $(RELEASE) --log $(LOG)

.PHONY: policies
policies: guard-CHART guard-RELEASE guard-LOG ## Install policies
	$(VENV)/bin/python3 ./hack/policies.py $(CHART) --release $(RELEASE) --log $(LOG)

# .PHONY: init ## Initialize environment
# init:
# 	poetry install
# 	$(ANSIBLE_VENV)/bin/pre-commit install


.PHONY: ghr-login
ghr-login: guard-GITHUB_TOKEN ## Authentication to the Github Registry
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u nlamirault --password-stdin

# ====================================
# K I N D
# ====================================

##@ Kind

.PHONY: kind-create
kind-create: ## Creates a local Kubernetes cluster (ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Create Kubernetes cluster ${SERVICE}$(NO_COLOR)"
	@kind create cluster --name=$(CLUSTER) --config=hack/kind-config.yaml --wait 180s

.PHONY: kind-delete
kind-delete: ## Delete a local Kubernetes cluster (ENV=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Create Kubernetes cluster ${SERVICE}$(NO_COLOR)"
	@kind delete cluster --name=$(CLUSTER)

.PHONY: kind-kube-credentials
kind-kube-credentials: ## Credentials for Kind (ENV=xxx)
	@kubectl config use-context $(KUBE_CONTEXT)


# ====================================
# H E L M
# ====================================

##@ Helm

.PHONY: helm-doc
helm-doc: guard-CHART ## Generate documentation
	@cd $(CHART) && helm-docs

.PHONY: helm-changelog
helm-changelog: guard-CHART ## Generate documentation
	@cd $(CHART) && helm-changelog

.PHONY: helm-template
helm-template: guard-CHART ## Generate manifest
	@helm template $(CHART) $(DEBUG)

.PHONY: helm-template-custom
helm-template-custom: guard-CHART ## Generate manifest
	@helm template $(CHART) --name-template=test --values $(CHART)/ci/test-values.yaml $(DEBUG)

.PHONY: helm-policy
helm-policy: guard-CHART guard-POLICY ## Check manifest
	@helm template $(CHART) | conftest test -p $(POLICY) --all-namespaces -

.PHONY: helm-lint
helm-lint: guard-CHART ## Lint Helm chart
	helm lint $(CHART) --values $(CHART)/values.yaml $(DEBUG)

.PHONY: helm-lint-custom
helm-lint-custom: guard-CHART ## Lint Helm chart
	helm lint $(CHART) --values $(CHART)/ci/test-values.yaml  $(DEBUG)

.PHONY: helm-lint-docker
helm-lint-docker: guard-CHART ## Lint Helm chart
	@docker run -it --rm -v ${HOME}:/root/ -v ${PWD}:/work -w /work --net host quay.io/helmpack/chart-testing ct lint --charts=charts/falco-talon --config .github/ct.yaml

.PHONY: helm-install
helm-install: guard-CHART guard-RELEASE ## Install a Helm chart
	helm install $(RELEASE) $(CHART)

.PHONY: helm-package
helm-package: guard-CHART ## Package a Helm chart
	helm package $(CHART)

.PHONY: helm-publish
helm-publish: guard-CHART guard-PKG ## Publish a Helm package to the Github Registry
	helm push ${PKG} oci://ghcr.io/portefaix/portefaix-hub/

.PHONY: helm-index
helm-index: ## Generate the index file for Helm charts
	helm-cr index -i ./index.yaml -p . --owner portefaix --git-repo portefaix-hub

# ====================================
# O P A
# ====================================

##@ Opa

.PHONY: opa-deps
opa-deps: ## Setup OPA dependencies
	@echo -e "$(OK_COLOR)[$(APP)] Install OPA policy $(POLICY)$(NO_COLOR)"
	@conftest pull --policy addons/policies/deprek8ion github.com/swade1987/deprek8ion//policies
	@conftest pull --policy addons/policies/portefaix github.com/portefaix/portefaix-policies?ref=v0.4.0//opa

.PHONY: opa-install
opa-install: guard-NAME guard-URL ## Install OPA policies
	@echo -e "$(OK_COLOR)[$(APP)] Install OPA policy $(POLICY)$(NO_COLOR)"
	@conftest pull --policy addons/policies/$(NAME) $(URL)
