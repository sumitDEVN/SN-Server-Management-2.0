#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Color Library
# ====================================

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
RESET="\033[0m"


success(){
    echo -e "${GREEN}[✓] $1${RESET}"
}


error(){
    echo -e "${RED}[✗] $1${RESET}"
}


warning(){
    echo -e "${YELLOW}[!] $1${RESET}"
}


info(){
    echo -e "${CYAN}[i] $1${RESET}"
}