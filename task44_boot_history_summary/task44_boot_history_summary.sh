#!/bin/bash

# ------------------------------------------------------------
# Script Name: task44_boot_history_summary.sh
# Description: Displays the 5 most recent system boots
# Author: [Your Name]
# Date: [Today's Date]
# ------------------------------------------------------------

# Output file
OUTPUT_FILE="boot_history_report.txt"

# Check if 'last' command exists
if ! command -v last &> /dev/null; then
    echo "Error: 'last' command not found. Install util-linux package."
    exit 1
fi

# Extract the 5 most recent boots and save to file
last reboot | head -n 5 > "$OUTPUT_FILE"

# Display to user
echo "=== Last 5 System Boots ==="
cat "$OUTPUT_FILE"

# Optional: Log action
LOG_FILE="/var/log/boot_history_summary.log"
echo "$(date): Boot history report generated with 5 entries." >> "$LOG_FILE"
