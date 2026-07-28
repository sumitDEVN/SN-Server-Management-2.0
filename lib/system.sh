#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# System Management
# ====================================

source lib/color.sh


system_info(){

    echo "================================"
    echo " SYSTEM INFORMATION"
    echo "================================"

    echo "Hostname : $(hostname)"
    echo "IP       : $(hostname -I | awk '{print $1}')"
    echo "OS       : $(lsb_release -d | cut -f2)"
    echo "Kernel   : $(uname -r)"
    echo "Uptime   : $(uptime -p)"

    echo "================================"

}



resource_info(){

    echo "================================"
    echo " RESOURCE STATUS"
    echo "================================"

    echo ""

    echo "CPU:"
    top -bn1 | grep "Cpu(s)"

    echo ""

    echo "Memory:"
    free -h

    echo ""

    echo "Disk:"
    df -h /

    echo "================================"

}



restart_ssh(){

    systemctl restart ssh

    if [ $? -eq 0 ]
    then
        success "SSH restarted successfully"
    else
        error "SSH restart failed"
    fi

}