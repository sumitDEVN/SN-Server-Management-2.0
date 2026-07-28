#!/bin/bash

PANEL_NAME="SN Server Management"

VERSION="2.0"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DB_DIR="$BASE_DIR/database"

USER_DB="$DB_DIR/users.db"

LOG_DIR="$BASE_DIR/logs"

SSH_PORT=22