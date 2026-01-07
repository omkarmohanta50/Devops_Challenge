# DevOps Engineering Challenge

This project demonstrates a secure, local DevOps workflow for deploying a minimal Python API.
The solution covers containerization, infrastructure provisioning, Kubernetes deployment, and automation.

---

## Prerequisites

The following tools must be installed on your local system before running the project:

- **Docker** – to build container images
- **Minikube** – to run a local Kubernetes cluster
- **kubectl** – to interact with the Kubernetes cluster
- **Terraform** – to provision Kubernetes resources
- **Helm** – to deploy the application to Kubernetes
- **Git** – to clone and manage the repository

> Note: This project was tested using **Minikube**.  

---

## How to Use `setup.sh`

The `setup.sh` script automates the complete local deployment process.

### What the script does:
1. Builds the Docker image locally
2. Initializes and applies the Terraform configuration
3. Installs or upgrades the Helm release in the Kubernetes cluster

### Run the setup script:
```bash
chmod +x setup.sh
./setup.sh

After successful execution, the application will be deployed into the Kubernetes cluster.

## Port 80 vs Non-Root Challenge

Normally in Linux, only the root user is allowed to run applications on port 80.
But running containers as root is not safe and is considered a bad practice.


To solve this problem, I kept the container running as a non-root user and used a Linux
capability called CAP_NET_BIND_SERVICE.


This capability allows a non-root process to use ports below 1024 (like port 80).
Because of this, the application can listen on port 80 without running as root.
