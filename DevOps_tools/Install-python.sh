#!/bin/bash
set -e

PYTHON_VERSION="3.12"   # Change this if you want a specific version

echo "🚀 Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🔧 Installing prerequisites..."
sudo apt-get install -y software-properties-common curl

echo "📦 Adding deadsnakes PPA (for latest Python versions)..."
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update -y

echo "🐍 Installing Python ${PYTHON_VERSION}..."
sudo apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python${PYTHON_VERSION}-venv python3-pip

echo "🔗 Setting default python3 to Python ${PYTHON_VERSION}..."
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYTHON_VERSION} 1
sudo update-alternatives --set python3 /usr/bin/python${PYTHON_VERSION}

echo "✅ Python installation completed!"
python3 --version
pip3 --version

echo "👉 To create a virtual environment, run:"
echo "   python3 -m venv myenv"
echo "   source myenv/bin/activate"
