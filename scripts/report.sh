#!/bin/bash
# report.sh: Generates daily report with ASCII progress bar

# Load settings
if [ -f $(dirname "$0")/../data/settings.conf ]; then
    source $(dirname "$0")/../data/settings.conf
else
    echo "Error: data/settings.conf not found."
    exit 1
fi

# Function to show progress bar
progress_bar() {
    local current=$1
    local total=$2
    local bars=10
    local filled=$((current * bars / total))
    local empty=$((bars - filled))
    printf "["
    printf "#%.0s" $(seq 1 $filled)
    printf "-%.0s" $(seq 1 $empty)
    printf "] %s/%s\n" "$current" "$total"
}

# Function to generate report
generate_report() {
    local date="$1"
    if [ -z "$date" ]; then
        date=$(date +%Y-%m-%d)
    fi
    # Sum intake for the given date
    total=$(grep "^$date," $(dirname "$0")/../data/water_log.txt | awk -F',' '{sum+=$2} END {print sum+0}')
    echo "Report for $date:"
    echo "Total intake: $total"
    echo "Daily goal: $GOAL"
    progress_bar $total $GOAL
}

# Handle arguments
case "$1" in
    --date) generate_report "$2" ;;
    *) generate_report ;;
esac
