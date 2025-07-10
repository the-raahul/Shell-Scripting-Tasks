#!/bin/bash

# ------------------------------------------------------------
# Script Name: task15_kernel_version_checker.sh
# Description: Compares current kernel version with latest available
#              and alerts if outdated. Supports Debian, RHEL, and Arch.
# Author: [Your Name]
# Date: [Today's Date]
# ------------------------------------------------------------

LOG_FILE="/var/log/kernel_version_check.log"
CURRENT_KERNEL=$(uname -r | sed 's/\.x86_64//')
LATEST_KERNEL=""
OS=""

# Simple OS detection
if [ -f /etc/debian_version ]; then
    OS="debian"
elif [ -f /etc/redhat-release ]; then
    OS="rhel"
elif grep -qi "arch" /etc/os-release; then
    OS="arch"
else
    echo "❌ Unsupported OS." | tee -a "$LOG_FILE"
    exit 1
fi

# Get latest available kernel based on OS
if [ "$OS" == "debian" ]; then
    LATEST_KERNEL=$(apt list --upgradable 2>/dev/null | grep -i linux-image | awk -F'[ /-]+' '{print $3}' | sort -V | tail -1)
elif [ "$OS" == "rhel" ]; then
    LATEST_KERNEL=$(yum --showduplicates list kernel 2>/dev/null | grep available | awk '{print $2}' | sort -V | tail -1)
elif [ "$OS" == "arch" ]; then
    LATEST_KERNEL=$(checkupdates 2>/dev/null | grep -i linux | awk '{print $2}' | sort -V | tail -1)
fi

# Log & display info
echo "----------------------------------------" >> "$LOG_FILE"
echo "$(date): Checking Kernel Version..." >> "$LOG_FILE"
echo "Detected OS: $OS" | tee -a "$LOG_FILE"
echo "Current Kernel: $CURRENT_KERNEL" | tee -a "$LOG_FILE"
echo "Latest Available Kernel: $LATEST_KERNEL" | tee -a "$LOG_FILE"

# Final check
if [[ "$LATEST_KERNEL" != "" && "$CURRENT_KERNEL" != "$LATEST_KERNEL" ]]; then
    echo -e "\n⚠️  Kernel update available. Please update your system."
    echo "$(date): Kernel is outdated." >> "$LOG_FILE"
else
    echo -e "\n✅  Kernel is up to date."
    echo "$(date): Kernel is up to date." >> "$LOG_FILE"
fi

