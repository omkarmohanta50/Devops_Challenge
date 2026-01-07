#!/bin/bash

set -e

# building the docker image

docker build -t devops-app:latest .

# applying terraform

cd terraform

terraform init

terraform apply -auto-approve

cd ..

#deploying with helm

cd helm/devops-app

helm upgrade --install devops-app . -n devops-challenge

cd ..

echo "setup completed successfully"
