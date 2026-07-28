#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Expiry System
# ====================================

source config.sh
source lib/color.sh
source lib/database.sh


check_expiry(){

    today=$(date +"%Y-%m-%d")


    while IFS="|" read -r username expiry
    do

        if [ "$expiry" \< "$today" ]
        then

            userdel -r "$username" 2>/dev/null

            remove_record "$username"

            warning "$username expired and removed"

        fi


    done < "$USER_DB"

}