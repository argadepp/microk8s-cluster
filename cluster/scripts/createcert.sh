#!/bin/bash

mkdir -p ssl

cat << EOF > ssl/req.cnf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name

[req_distinguished_name]

[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = ip-172-31-4-232.ap-south-1.compute.internal
IP.1 = 172.31.4.232
EOF

openssl genrsa -out ssl/ca.key 4096
openssl req -x509 -new -nodes -key ssl/ca.key -days 3650 -out ssl/ca.crt -subj "/CN=kube-ca"

openssl genrsa -out ssl/tls.key 4096
openssl req -new -key ssl/tls.key -out ssl/tls.csr -subj "/CN=kube-ca" -config ssl/req.cnf
openssl x509 -req -in ssl/tls.csr -CA ssl/ca.crt -CAkey ssl/ca.key -CAcreateserial -out ssl/tls.crt -days 3650 -extensions v3_req -extfile ssl/req.cnf