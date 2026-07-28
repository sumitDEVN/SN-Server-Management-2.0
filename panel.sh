#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.1
# Main Panel
# ====================================


source config.sh

source lib/color.sh
source lib/logger.sh
source lib/database.sh
source lib/user.sh
source lib/system.sh


init_database
init_logger



banner(){

clear

echo -e "${CYAN}"
echo "===================================="
echo "     SN SERVER MANAGEMENT 2.1"
echo "===================================="
echo -e "${RESET}"

}



menu(){

echo ""
echo "1. Create SSH User"
echo "2. Delete SSH User"
echo "3. Change Password"
echo "4. Extend Expiry"
echo "5. User Information"
echo "6. List Users"
echo ""
echo "7. Server Information"
echo "8. Resource Usage"
echo "9. Show Logs"
echo ""
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
change_password
;;


4)
extend_expiry
;;


5)
user_info
;;


6)
list_users
;;


7)
system_info
;;


8)
resource_info
;;


9)
show_logs
;;


0)
exit
;;


*)
error "Invalid option"
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