#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🔧 Installing required packages..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔑 Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📦 Setting up the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index..."
sudo apt-get update -y

echo "🐳 Installing Docker Engine, CLI, and containerd..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "👤 Adding user '$USER' to docker group..."
sudo usermod -aG docker $USER

echo "✅ Docker installation completed!"
echo "⚠️ Please log out and log back in so your group membership is re-evaluated."
echo "👉 Verify installation by running: docker run hello-world"
