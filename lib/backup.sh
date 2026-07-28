#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Backup & Restore System
# ====================================

source config.sh
source lib/color.sh
source lib/logger.sh


BACKUP_DIR="$BASE_DIR/backup"



init_backup(){

    if [ ! -d "$BACKUP_DIR" ]
    then
        mkdir -p "$BACKUP_DIR"
    fi

}



create_backup(){

    init_backup


    DATE=$(date +"%Y-%m-%d_%H-%M-%S")


    FILE="$BACKUP_DIR/sn_backup_$DATE.tar.gz"


    tar -czf "$FILE" \
    "$USER_DB" \
    "$LOG_DIR" \
    "$BASE_DIR/config.sh"


    log_action "BACKUP" "SYSTEM" "SUCCESS"


    success "Backup created:"
    echo "$FILE"

}



list_backup(){

    init_backup


    echo "=========================="
    echo " BACKUP LIST"
    echo "=========================="


    ls -lh "$BACKUP_DIR"

}



restore_backup(){

    read -p "Enter backup file name: " file


    if [ -f "$BACKUP_DIR/$file" ]
    then

        tar -xzf "$BACKUP_DIR/$file" -C /


        log_action "RESTORE" "SYSTEM" "SUCCESS"


        success "Restore completed"

    else

        error "Backup file not found"

    fi

}