#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Online User Monitor
# ====================================

source lib/color.sh


online_users(){

    echo "================================"
    echo " ONLINE SSH USERS"
    echo "================================"

    echo ""

    who

    echo ""

    success "Online user check completed"

}



ssh_sessions(){

    echo "================================"
    echo " SSH SESSIONS"
    echo "================================"

    echo ""

    ss -tnp | grep sshd

    echo ""

}



user_connections(){

    read -p "Enter username: " username


    echo "================================"
    echo " USER CONNECTIONS"
    echo "================================"


    who | grep "$username"


}