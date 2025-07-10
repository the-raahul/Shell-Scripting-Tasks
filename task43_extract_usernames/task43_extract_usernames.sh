#!/bin/bash

# ------------------------------------------------------------
# Script Name: task43_extract_usernames.sh
# Description: Extracts all usernames from /etc/passwd
#              and saves them to userlist.txt
# Name : Rahul Kumar
# ------------------------------------------------------------

# Output file
OUTPUT_FILE="userlist.txt"
LOG_FILE="/var/log/user_extract.log"

# Check if /etc/passwd exists and is readable
if [ ! -r /etc/passwd ]; then
    echo "Error: /etc/passwd not found or not readable."
    exit 1
fi

# Extract usernames (first field) and save to userlist.txt
cut -d':' -f1 /etc/passwd > "$OUTPUT_FILE"

# Confirm success
if [ $? -eq 0 ]; then
    USER_COUNT=$(wc -l < "$OUTPUT_FILE")
    echo "Successfully extracted $USER_COUNT usernames to $OUTPUT_FILE."

    # Optional: Log the event with timestamp
    echo "$(date): Extracted $USER_COUNT usernames to $OUTPUT_FILE" >> "$LOG_FILE"
else
    echo "Failed to extract usernames."
    exit 2
fi
