#!/bin/bash
# logger.sh: Logs water intake and manages settings

# Load settings
if [ -f $(dirname "$0")/../data/settings.conf ]; then
    source $(dirname "$0")/../data/settings.conf
else
    echo "Error: data/settings.conf not found."
    exit 1
fi

# Function to log water
log_water() {
    read -p "Enter water amount (glasses or ml): " amount
    if [[ ! $amount =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Enter a valid number."
        exit 1
    fi
    echo "$(date +%Y-%m-%d),$amount" >> $(dirname "$0")/../data/water_log.txt
    # Show random motivational message
    if [ -f $(dirname "$0")/../data/messages.txt ]; then
        message=$(shuf -n 1 $(dirname "$0")/../data/messages.txt)
        echo "$message"
    else
        echo "Keep drinking!"
    fi
}

# Function to set goal
set_goal() {
    read -p "Enter daily goal (glasses or ml): " new_goal
    if [[ ! $new_goal =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Enter a valid number."
        exit 1
    fi
    sed -i "s/GOAL=.*/GOAL=$new_goal/" $(dirname "$0")/../data/settings.conf
    echo "Goal updated to $new_goal."
}

# Function to set reminder interval
set_interval() {
    read -p "Enter reminder interval (number): " new_interval
    if [[ ! $new_interval =~ ^[0-9]+$ ]]; then
        echo "Error: Enter a valid number."
        exit 1
    fi
    read -p "Enter unit (hours or minutes): " new_unit
    if [[ "$new_unit" != "hours" && "$new_unit" != "minutes" ]]; then
        echo "Error: Unit must be 'hours' or 'minutes'."
        exit 1
    fi
    sed -i "s/INTERVAL=.*/INTERVAL=$new_interval/" $(dirname "$0")/../data/settings.conf
    sed -i "s/INTERVAL_UNIT=.*/INTERVAL_UNIT=$new_unit/" $(dirname "$0")/../data/settings.conf
    echo "Interval updated to $new_interval $new_unit."
    echo "Restart reminders (option 7, then 8) to apply changes."
}

# Function to set reminder message
set_message() {
    read -p "Enter new reminder message: " new_message
    sed -i "s/MESSAGE=.*/MESSAGE=\"$new_message\"/" $(dirname "$0")/../data/settings.conf
    echo "Reminder message updated."
}

# Handle arguments
case "$1" in
    --log) log_water ;;
    --set-goal) set_goal ;;
    --set-interval) set_interval ;;
    --set-message) set_message ;;
    *) echo "Usage: $0 [--log | --set-goal | --set-interval | --set-message]" ;;
esac
