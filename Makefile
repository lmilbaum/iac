.PHONY: all clean test

ENV := dev
TERRAGRUNT_CMD = cd live/${ENV} && terragrunt run-all --terragrunt-non-interactive

.PHONY: tf/init
tf/init:
	${TERRAGRUNT_CMD} init

.PHONY: tf/plan
tf/plan:
	${TERRAGRUNT_CMD} plan -out tfplan

.PHONY: tf/graph
tf/graph:
	${TERRAGRUNT_CMD} graph

.PHONY: tf/apply
tf/apply:
	${TERRAGRUNT_CMD} apply

.PHONY: tf/destroy
tf/destroy:
	${TERRAGRUNT_CMD} destroy -terragrunt-log-level debug

tf/apply/audit:
	cd live/${ENV}/audit && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/apply/gitlab-permissions:
	cd live/${ENV}/gitlab-permissions && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/apply/gitlab-runners:
	cd live/${ENV}/gitlab-runners && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/apply/oidc:
	cd live/${ENV}/oidc && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/init/renovate-runners:
	cd live/${ENV}/renovate-runners && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/plan/renovate-runners:
	cd live/${ENV}/renovate-runners && terragrunt run-all --terragrunt-non-interactive apply -auto-approve

tf/apply/renovate-runners:
	cd live/${ENV}/renovate-runners && terragrunt run-all --terragrunt-non-interactive apply -auto-approve
