#!/bin/bash
set -euo pipefail

echo "🚀 Setting up EC2 instance for Flask CI/CD deployment..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install Docker
echo "🐳 Installing Docker..."
sudo apt-get install -y docker.io

# Start Docker service
echo "🔧 Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group
echo "👤 Adding ubuntu user to docker group..."
sudo usermod -aG docker ubuntu

# Install git
echo "📂 Installing Git..."
sudo apt-get install -y git

# Install Python and pip (optional, for testing)
echo "🐍 Installing Python..."
sudo apt-get install -y python3 python3-pip

# Install Docker Compose (optional)
echo "🐳 Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone or navigate to project repository
echo "📥 Cloning Flask DevOps Project..."
cd /home/ubuntu
if [ ! -d "Flasks-Devops-Project" ]; then
  git clone https://github.com/YOUR_USERNAME/Flasks-Devops-Project.git
fi

echo "✅ EC2 setup completed successfully!"
echo "📝 Note: You may need to log out and back in for docker group changes to take effect."
