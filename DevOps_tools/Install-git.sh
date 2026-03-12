#!/bin/bash
set -e

echo "🚀 Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🔧 Installing Git..."
sudo apt-get install -y git

echo "✅ Git installation completed!"

# Show version
git --version

echo "👉 You can now configure Git with:"
echo "   git config --global user.name \"Your Name\""
echo "   git config --global user.email \"your.email@example.com\""
