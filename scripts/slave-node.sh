#!/bin/bash

sudo apt update 

sudo apt install docker.io docker-compose -y

sudo chmod 777 /var/run/docker.sock

sudo userdmod -aG docker ubuntu

sudo snap install microk8s --classic --channel 1.22-eksd/stable

sudo microk8s join eks.pratikargade.online:25000/2b8363c31da33fe4b5cfc08bcbd28bd1/19f857c82adf --worker
# sudo microk8s start
# sudo microk8s enable metallb:192.168.1.200-192.168.1.220
# sudo microk8s enable ingress
# sudo mkdir /home/ubuntu/.kube
# sudo chown ubuntu /home/ubuntu/.kube
# sudo microk8s config > /home/ubuntu/.kube/config
# sudo microk8s enable hostpath-storage
# sudo microk8s enable host-access:ip=0.0.0.0
############ Install Kubectl ##############
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

