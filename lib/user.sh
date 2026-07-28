#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.1
# User Management System
# ====================================

source config.sh
source lib/color.sh
source lib/database.sh
source lib/logger.sh


create_user(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then
        error "System user already exists"
        return
    fi


    read -s -p "Enter password: " password
    echo ""


    read -p "Expiry days: " days


    if ! [[ "$days" =~ ^[0-9]+$ ]]
    then
        error "Invalid expiry days"
        return
    fi


    expiry=$(date -d "+$days days" +"%Y-%m-%d")


    useradd -m -s /bin/bash "$username"


    echo "$username:$password" | chpasswd


    add_user_record "$username" "$expiry" "active"


    log_action "CREATE_USER" "$username" "SUCCESS"


    success "User created successfully"

}



delete_user(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then

        userdel -r "$username"

        remove_user_record "$username"

        log_action "DELETE_USER" "$username" "SUCCESS"


        success "User deleted"

    else

        error "User not found"

    fi

}



change_password(){

    read -p "Enter username: " username


    if id "$username" &>/dev/null
    then

        read -s -p "New password: " password
        echo ""

        echo "$username:$password" | chpasswd


        log_action "CHANGE_PASSWORD" "$username" "SUCCESS"


        success "Password changed"

    else

        error "User not found"

    fi

}



extend_expiry(){

    read -p "Enter username: " username


    if user_exists "$username"
    then

        read -p "Add days: " days


        current=$(get_user_data "$username" | cut -d"|" -f2)


        new_date=$(date -d "$current + $days days" +"%Y-%m-%d")


        old=$(get_user_data "$username")


        status=$(echo "$old" | cut -d"|" -f3)
        created=$(echo "$old" | cut -d"|" -f4)


        update_user_record "$username|$new_date|$status|$created"


        log_action "EXTEND_EXPIRY" "$username" "SUCCESS"


        success "Expiry updated"

    else

        error "User not found"

    fi

}



user_info(){

    read -p "Enter username: " username


    if user_exists "$username"
    then

        echo "========================"
        echo "USER INFORMATION"
        echo "========================"

        get_user_data "$username"

    else

        error "User not found"

    fi

}



list_users(){

    echo "========================"
    echo "USER LIST"
    echo "========================"

    list_database

}