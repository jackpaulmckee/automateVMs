#!/usr/bin/env bash
set -e  # Exit immediately if any command fails

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install required system packages
echo "Installing Python and venv packages..."
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y unzip

# Create virtual environment if it doesnt exist
if [ ! -d ".venv" ]; then
    echo "Creating new virtual environment..."
    python3 -m venv .venv
else
    echo "Virtual environment already exists, skipping creation."
fi

# Activate venv
echo "Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip (idempotent)
pip install --upgrade pip

# Install Python dependencies (idempotent)
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "No requirements.txt found. Skipping Python dependency install."
fi

# Install Ansible Collections (idempotent)
if [ -f "collections/requirements.yml" ]; then
    echo "Installing Ansible collections..."
    ansible-galaxy collection install -r collections/requirements.yml -p collections
else
    echo "No collections/requirements.yml file found. Skipping collections install."
fi

# Final info
echo "Setup complete!"
echo "Python version: $(python --version)"
echo "Pip version: $(pip --version)"
echo "Ansible version: $(ansible --version | head -n 1)"
