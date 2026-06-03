#!/bin/bash

LOG_FILE="logs/nginx_recovery.log"

echo "===== NGINX MONITOR STARTED ====="

if systemctl is-active --quiet nginx; then
    echo "$(date): Nginx is running OK" | tee -a "$LOG_FILE"
    echo "STATUS: OK"
else
    echo "$(date): Nginx is DOWN. Restarting..." | tee -a "$LOG_FILE"

    sudo systemctl restart nginx

    if systemctl is-active --quiet nginx; then
        echo "$(date): Nginx restarted successfully" | tee -a "$LOG_FILE"
        echo "STATUS: RECOVERED"
    else
        echo "$(date): FAILED to restart nginx" | tee -a "$LOG_FILE"
        echo "STATUS: FAILED"
    fi
fi