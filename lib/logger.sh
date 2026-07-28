#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.1
# Logger System
# ====================================

source config.sh


LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/activity.log"



init_logger(){

    if [ ! -d "$LOG_DIR" ]
    then
        mkdir -p "$LOG_DIR"
    fi


    if [ ! -f "$LOG_FILE" ]
    then
        touch "$LOG_FILE"
    fi

}



log_action(){

    ACTION="$1"
    USERNAME="$2"
    STATUS="$3"


    DATE=$(date "+%Y-%m-%d %H:%M:%S")


    echo "$DATE | $ACTION | $USERNAME | $STATUS" >> "$LOG_FILE"

}



show_logs(){

    if [ -f "$LOG_FILE" ]
    then

        cat "$LOG_FILE"

    else

        echo "No logs found"

    fi

}