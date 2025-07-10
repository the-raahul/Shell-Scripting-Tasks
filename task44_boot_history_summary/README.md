# Task 44 – Display System Boot History Summary

This script is part of a Linux System Administration shell scripting project. It retrieves and displays the **5 most recent system boots** from the system logs.

## 📜 Script Name
`task44_boot_history_summary.sh`

## 🔧 What It Does
- Uses the `last reboot` command to list system reboot entries
- Filters and displays the top 5 most recent boots
- Saves the output to a file named `boot_history_report.txt`
- Optionally logs script execution to `/var/log/boot_history_summary.log`

## ▶️ How to Run

```bash
chmod +x task44_boot_history_summary.sh
./task44_boot_history_summary.sh
