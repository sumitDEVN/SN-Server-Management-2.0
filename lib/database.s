#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Database System
# ====================================

source config.sh


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



add_record(){

    username=$1
    expiry=$2

    echo "$username|$expiry" >> "$USER_DB"

}



remove_record(){

    username=$1

    sed -i "/^$username|/d" "$USER_DB"

}



list_records(){

    cat "$USER_DB"

}