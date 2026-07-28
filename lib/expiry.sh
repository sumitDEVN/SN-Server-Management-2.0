#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Expiry Management System
# ====================================

source config.sh
source lib/database.sh
source lib/logger.sh
source lib/color.sh


check_expiry(){


    today=$(date +"%Y-%m-%d")


    if [ ! -f "$USER_DB" ]
    then
        error "Database not found"
        return
    fi


    while IFS="|" read -r username expiry status created
    do


        [ -z "$username" ] && continue


        if [[ "$status" == "active" ]]
        then


            if [[ "$expiry" < "$today" || "$expiry" == "$today" ]]
            then


                usermod -L "$username" 2>/dev/null


                sed -i "s/^$username|.*/$username|$expiry|expired|$created/" "$USER_DB"


                log_action "EXPIRY_CHECK" "$username" "EXPIRED"


                warning "$username expired"


            fi


        fi


    done < "$USER_DB"


    success "Expiry check completed"

}



remove_expired_users(){


    while IFS="|" read -r username expiry status created
    do


        if [[ "$status" == "expired" ]]
        then

            userdel -r "$username" 2>/dev/null


            sed -i "/^$username|/d" "$USER_DB"


            log_action "AUTO_REMOVE" "$username" "SUCCESS"


        fi


    done < "$USER_DB"


    success "Expired users removed"

}