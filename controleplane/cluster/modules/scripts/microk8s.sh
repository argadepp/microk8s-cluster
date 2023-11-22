#!/bin/bash

sudo apt update 

sudo apt install docker.io docker-compose -y

sudo chmod 777 /var/run/docker.sock

sudo userdmod -aG docker ubuntu

sudo snap install microk8s --classic --channel 1.24-eksd/stable

sudo microk8s start
sudo microk8s enable metallb:192.168.1.200-192.168.1.220
sudo microk8s enable ingress
sudo mkdir /home/ubuntu/.kube
sudo chown ubuntu /home/ubuntu/.kube
sudo microk8s config > /home/ubuntu/.kube/config
sudo microk8s enable hostpath-storage
sudo microk8s enable host-access:ip=0.0.0.0

# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

############ Install Kubectl ##############
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

####### Install Helm #############

wget https://get.helm.sh/helm-v3.11.2-linux-amd64.tar.gz
tar -xvzf helm-v3.11.2-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/bin/helm

