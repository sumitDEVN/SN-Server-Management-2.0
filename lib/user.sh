#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# User Management System
# ====================================

source config.sh
source lib/color.sh
source lib/database.sh


create_user(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then
        error "User already exists!"
        return
    fi


    read -s -p "Enter password: " password
    echo ""


    read -p "Expiry days: " days


    expiry=$(date -d "+$days days" +"%Y-%m-%d")


    useradd -m -s /bin/bash "$username"


    echo "$username:$password" | chpasswd


    add_record "$username" "$expiry"


    success "User created successfully"
    info "Username : $username"
    info "Expiry   : $expiry"

}



delete_user(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then

        userdel -r "$username"

        remove_record "$username"

        success "User deleted"

    else

        error "User not found"

    fi

}



list_users(){

    echo "=============================="
    echo " SSH USER LIST"
    echo "=============================="


    if [ -s "$USER_DB" ]
    then

        cat "$USER_DB"

    else

        warning "No user found"

    fi

}



check_user(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then

        success "User exists"

    else

        error "User not found"

    fi

}