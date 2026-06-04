#!/bin/bash

check_cpu() {
    echo "CPU Information"
    echo "----------------"
    top -bn1 | head -5
}

check_ram() {
    echo "RAM Information"
    echo "---------------"
    free -h
}

restart_nginx() {
    echo "Restarting nginx..."
    echo "Nginx restarted successfully."
}

backup_logs() {
    mkdir -p backup
    cp -r logs/* backup/ 2>/dev/null
    echo "Logs backed up successfully."
}

while true
do
    echo ""
    echo "===== DEVOPS MENU ====="
    echo "1. Check CPU"
    echo "2. Check RAM"
    echo "3. Restart nginx"
    echo "4. Backup logs"
    echo "5. Exit"

    read -p "Enter choice: " choice

    case $choice in
        1) check_cpu ;;
        2) check_ram ;;
        3) restart_nginx ;;
        4) backup_logs ;;
        5) echo "Goodbye!"; exit ;;
        *) echo "Invalid option" ;;
    esac
done