#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.1
# Database System
# ====================================

source config.sh
source lib/logger.sh


init_database(){

    if [ ! -d "$DB_DIR" ]
    then
        mkdir -p "$DB_DIR"
    fi


    if [ ! -f "$USER_DB" ]
    then
        touch "$USER_DB"
    fi

}



add_user_record(){

    username="$1"
    expiry="$2"
    status="$3"


    created=$(date "+%Y-%m-%d")


    echo "$username|$expiry|$status|$created" >> "$USER_DB"


    log_action "ADD_USER_DB" "$username" "SUCCESS"

}



remove_user_record(){

    username="$1"


    if grep -q "^$username|" "$USER_DB"
    then

        sed -i "/^$username|/d" "$USER_DB"

        log_action "REMOVE_USER_DB" "$username" "SUCCESS"

        return 0

    else

        log_action "REMOVE_USER_DB" "$username" "FAILED"

        return 1

    fi

}



user_exists(){

    username="$1"


    if grep -q "^$username|" "$USER_DB"
    then
        return 0
    else
        return 1
    fi

}



get_user_data(){

    username="$1"


    grep "^$username|" "$USER_DB"

}



update_user_record(){

    username="$1"
    new_data="$2"


    sed -i "s/^$username|.*/$new_data/" "$USER_DB"


    log_action "UPDATE_USER_DB" "$username" "SUCCESS"

}



list_database(){

    cat "$USER_DB"

}