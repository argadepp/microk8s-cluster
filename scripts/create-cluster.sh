#!/bin/bash

cd "${WORKSPACE}/EC2"
terraform init

terraform plan \
          -var "instanceType=${instanceType}" \
          -var "region=${region}" \
          -var "product=${product}" \
          -var "environment=${environment}"