#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Professional Dashboard
# ====================================

source config.sh
source lib/color.sh


show_dashboard(){

clear

echo -e "${CYAN}"
echo "======================================"
echo "      SN SERVER MANAGEMENT 2.0"
echo "======================================"
echo -e "${RESET}"


echo ""


# Server Info

IP=$(hostname -I | awk '{print $1}')

HOST=$(hostname)

OS=$(grep PRETTY_NAME /etc/os-release 2>/dev/null | cut -d '"' -f2)


echo "Server IP   : $IP"
echo "Hostname    : $HOST"
echo "OS          : $OS"


echo ""


# Uptime

UPTIME=$(uptime -p)

echo "Uptime      : $UPTIME"


echo ""


# CPU

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "CPU Usage   : ${CPU}%"


# RAM

RAM=$(free | awk '/Mem/{printf "%.2f", $3/$2*100}')

echo "RAM Usage   : ${RAM}%"


# Disk

DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk Usage  : $DISK"


echo ""


# User Count

if [ -f "$USER_DB" ]
then

TOTAL=$(wc -l < "$USER_DB")

ACTIVE=$(grep "|active|" "$USER_DB" | wc -l)

EXPIRED=$(grep "|expired|" "$USER_DB" | wc -l)


echo "Total Users : $TOTAL"
echo "Active      : $ACTIVE"
echo "Expired     : $EXPIRED"

else

echo "User Data   : Not Found"

fi


echo ""

echo "======================================"

}