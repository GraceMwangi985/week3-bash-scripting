#!/bin/bash

echo "===== EC2 SETUP AUTOMATION ====="

echo "Updating packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Installing Docker..."
sudo apt install docker.io -y

echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

echo "Cloning GitHub repository..."
git clone https://github.com/GraceMwangi985/week3-bash-scripting.git

echo "Deploying application..."
echo "Application deployment completed."

echo "===== SETUP COMPLETE ====="