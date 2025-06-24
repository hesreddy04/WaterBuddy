#!/bin/bash
# reminder.sh: Sends a hydration reminder to reminder.log

# Load settings
if [ -f $(dirname "$0")/../data/settings.conf ]; then
    source $(dirname "$0")/../data/settings.conf
else
    echo "Error: data/settings.conf not found."
    exit 1
fi

# Log reminder to reminder.log
echo "$(date '+%Y-%m-%d %H:%M:%S'): $MESSAGE" >> $(dirname "$0")/../data/reminder.log
