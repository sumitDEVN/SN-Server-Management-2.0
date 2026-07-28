#!/bin/bash

# ====================================
# SN SERVER MANAGEMENT 2.0
# Cron Installer
# ====================================


BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"


CRON_JOB="0 0 * * * root bash $BASE_DIR/cron/expiry_cron.sh"



echo "$CRON_JOB" > /etc/cron.d/sn-expiry


chmod 644 /etc/cron.d/sn-expiry


echo "Cron installed successfully"