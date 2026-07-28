#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Main Panel
# ====================================

source config.sh

source lib/color.sh
source lib/database.sh
source lib/user.sh
source lib/system.sh
source lib/expiry.sh


init_database


banner(){

clear

echo -e "${CYAN}"
echo "======================================"
echo "      SN SERVER MANAGEMENT 2.0"
echo "======================================"
echo -e "${RESET}"

}



menu(){

echo ""
echo "1. Create SSH User"
echo "2. Delete SSH User"
echo "3. List Users"
echo "4. Check Expiry"
echo "5. Server Information"
echo "6. Resource Usage"
echo "7. Restart SSH"
echo "0. Exit"
echo ""

read -p "Select Option: " option


case $option in

1)
create_user
;;

2)
delete_user
;;

3)
list_users
;;

4)
check_expiry
;;

5)
system_info
;;

6)
resource_info
;;

7)
restart_ssh
;;

0)
exit
;;

*)
error "Invalid Option"
;;

esac


echo ""
read -p "Press Enter to continue..."

}



while true
do

banner
menu

done