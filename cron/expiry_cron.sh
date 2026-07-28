#!/bin/bash


BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"


cd "$BASE_DIR"


bash -c "source lib/expiry.sh && check_expiry && remove_expired_users"