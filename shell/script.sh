#!/usr/bin/env bash
set -euo pipefail

STDOUT="/dev/stdout"
LOG_FILE="$STDOUT"
LOG_MESSAGE="is the date, should log to $STDOUT"

# log with timestamp
log_message() {
    [[ -z "${1:-}" ]] && return 1 # Check if the message is empty
    printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$1" >> "$LOG_FILE"
}

log_message "$LOG_MESSAGE"
