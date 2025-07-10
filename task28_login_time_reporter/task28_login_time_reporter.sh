#!/bin/bash

# ------------------------------------------------------------
# Script Name: task28_login_time_reporter.sh
# Description: Shows total login time per user in minutes
# Author: [Your Name]
# Date: [Today's Date]
# ------------------------------------------------------------

OUTPUT_FILE="weekly_login_report.txt"

# Create or clear the output file
echo "User      | Total Minutes Logged In" > "$OUTPUT_FILE"
echo "-------------------------------" >> "$OUTPUT_FILE"

# Process each line from 'last'
last | grep -vE 'reboot|wtmp|still logged in' | while read -r line; do
    user=$(echo "$line" | awk '{print $1}')
    time=$(echo "$line" | grep -oE '[0-9]+:[0-9]+' | tail -1)

    if [[ "$time" =~ ^[0-9]+:[0-9]+$ ]]; then
        IFS=':' read -r h m <<< "$time"
        minutes=$((10#$h * 60 + 10#$m))
        echo "$user $minutes"
    fi
done | awk '{arr[$1]+=$2} END {for (u in arr) printf "%-10s| %d\n", u, arr[u]}' >> "$OUTPUT_FILE"

# Show the report
cat "$OUTPUT_FILE"

