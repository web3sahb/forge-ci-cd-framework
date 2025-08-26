#!/bin/bash

# Forge CI/CD Framework Installer
# Author: M Sahban Ansari | Scalable Systems Studio

set -euo pipefail

echo "[+] Deploying Forge CI/CD Framework to Kubernetes..."
echo "[+] Creating forge namespace..."

# Create namespace
kubectl apply -f manifests/namespace.yaml

# Deploy Jenkins
echo "[+] Deploying Jenkins CI Server..."
kubectl apply -f manifests/jenkins.deployment.yaml
kubectl apply -f manifests/jenkins.service.yaml

# Deploy Nexus
echo "[+] Deploying Nexus Repository Manager..."
kubectl apply -f manifests/nexus.deployment.yaml

# Wait for Jenkins to be ready
echo "[+] Waiting for Jenkins to become ready..."
JENKINS_POD=$(kubectl get pod -n forge -l app=jenkins -o jsonpath="{.items[0].metadata.name}")
kubectl wait --for=condition=ready -n forge pod/$JENKINS_POD --timeout=300s

echo "[✓] Forge CI/CD deployment complete!"
echo "[✓] Jenkins URL: http://your-k8s-node-ip:30008"
echo "[✓] Nexus URL: http://your-k8s-node-ip:30009"