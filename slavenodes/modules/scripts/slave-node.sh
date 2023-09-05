#!/bin/bash

sudo apt update 

sudo apt install docker.io docker-compose -y

sudo chmod 777 /var/run/docker.sock

sudo userdmod -aG docker ubuntu

sudo snap install microk8s --classic --channel 1.22-eksd/stable

sudo microk8s join 172.31.0.42:25000/81affa0eeac5b2a5740fcca60b538c31/6db437d4203e
 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

