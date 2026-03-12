#!/bin/bash
set -e

echo "🚀 Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🔧 Installing prerequisites..."
sudo apt-get install -y apt-transport-https curl gnupg

echo "🔑 Adding Helm GPG key..."
curl https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /usr/share/keyrings/helm.gpg

echo "📦 Adding Helm APT repository..."
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | \
  sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

echo "🔄 Updating package index..."
sudo apt-get update -y

echo "🐳 Installing Helm..."
sudo apt-get install -y helm

echo "✅ Helm installation completed!"
helm version

echo "👉 You can now add Helm charts with:"
echo "   helm repo add stable https://charts.helm.sh/stable"
echo "   helm repo update"
echo "   helm search repo <chart-name>"
