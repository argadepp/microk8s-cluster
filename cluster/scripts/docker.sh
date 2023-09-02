#!/bin/bash

sudo apt update 

sudo apt install docker.io docker-compose -y

sudo chmod 777 /var/run/docker.sock

sudo userdmod -aG docker ubuntu