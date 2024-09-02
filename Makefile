KIND = kind
KUBECTL = kubectl
CLUSTER_NAME ?= demo-stuff
KIND_CONFIG = config.yaml
K8S_DIR = k8s
NAMESPACE = default
CHDIR = ../utilities
TARGET ?= utilities
# Default target
.PHONY: all
all: create-cluster

# Create kind cluster
.PHONY: create-cluster
create-cluster:
	$(KIND) create cluster --name $(CLUSTER_NAME) --config $(KIND_CONFIG)

#install ingress controller
ingress: deploy ingress controller
install-ingress:
	kubectl create namespace ingress-nginx
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

#install specific utility on cluster
utilities:
install-utility:
	terraform -chdir=${CHDIR} plan
	terraform -chdir=${CHDIR} apply -target=helm_release.${TARGET} --auto-approve
