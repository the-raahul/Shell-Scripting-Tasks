# Task 45 – Display Last 10 Failed Login Attempts

This script is part of a Linux System Administration shell scripting project. It scans authentication logs and displays the **latest 10 failed SSH login attempts**, useful for auditing and system security monitoring.

## 📜 Script Name
`task45_failed_login_report.sh`

## 🔧 What It Does
- Detects and reads from `/var/log/auth.log` (Debian-based) or `/var/log/secure` (RHEL-based)
- Extracts lines with failed login attempts using `grep`
- Displays the **most recent 10 attempts**
- Saves the output to `failed_login_report.txt`
- Optionally logs script execution to `/var/log/failed_login_script.log`

## ▶️ How to Run

```bash
chmod +x task45_failed_login_report.sh
./task45_failed_login_report.sh
