#!/bin/bash

echo "===== DEPLOYMENT STARTED ====="

# Pull latest code
echo "Pulling latest code from GitHub..."
git pull origin main

# Clear cache
echo "Clearing cache..."
rm -rf cache/* 2>/dev/null

# Restart application
echo "Restarting application..."
systemctl restart myapp

# Verify service health
echo "Checking service health..."

if systemctl is-active --quiet myapp; then
    echo "Application is running successfully."
else
    echo "Application health check failed."
fi

echo "===== DEPLOYMENT COMPLETE ====="