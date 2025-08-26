# Forge - CI/CD Framework for Kubernetes

**A modular, production-ready CI/CD framework that automates build, test, and deployment pipelines on Kubernetes.**

## 🚀 What It Does

- **One-Click Deployment:** Installs Jenkins, Nexus, and SonarQube on any Kubernetes cluster.
- **Modular Pipelines:** Pre-built Jenkins pipelines for Spring Boot, Node.js, and Python applications.
- **Security First:** Integrates with Vault for secret management and security scanning.
- **Helm Ready:** Includes Helm charts for customizable deployments.

## ⚡ Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/web3sahb/forge-ci-cd-framework.git
cd forge-ci-cd-framework

# 2. Deploy to Kubernetes (requires kubectl)
bash install.sh

PROJECT STRUCTURE:
forge-ci-cd-framework/
├── install.sh                 # One-click deployment script
├── manifests/                 # Kubernetes manifests
│   ├── namespace.yaml
│   ├── jenkins.deployment.yaml
│   ├── jenkins.service.yaml
│   ├── nexus.deployment.yaml
│   └── sonarqube.deployment.yaml
├── pipelines/                 # Jenkins declarative pipelines
│   ├── spring-boot.Jenkinsfile
│   ├── nodejs.Jenkinsfile
│   └── python.Jenkinsfile
├── scripts/                   # Deployment and utility scripts
│   ├── vault-integration.sh
│   └── k8s-deploy.sh
├── charts/                    # Helm charts
│   └── forge/
│       ├── Chart.yaml
│       └── values.yaml
└── docs/
    └── ARCHITECTURE.md
