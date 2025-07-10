#!/bin/bash

# ------------------------------------------------------------
# Script Name: task45_failed_login_report.sh
# Description: Displays the last 10 failed SSH login attempts
# Name : Rahul Kumar
# ------------------------------------------------------------

# Output file
OUTPUT_FILE="failed_login_report.txt"
LOG_FILE="/var/log/failed_login_script.log"

# Detect appropriate log file based on OS
if [ -f /var/log/auth.log ]; then
    LOGFILE="/var/log/auth.log"    # Debian/Ubuntu
elif [ -f /var/log/secure ]; then
    LOGFILE="/var/log/secure"      # RHEL/CentOS/Fedora
else
    echo "Error: No known authentication log file found."
    exit 1
fi

# Extract last 10 failed SSH login attempts
grep "Failed password" "$LOGFILE" | tail -n 10 > "$OUTPUT_FILE"

# Display to user
echo "=== Last 10 Failed Login Attempts ==="
cat "$OUTPUT_FILE"

# Optional: Log script usage
echo "$(date): Extracted last 10 failed logins from $LOGFILE" >> "$LOG_FILE"
