# Task 28 – Login Time Reporter

This script calculates the total login duration per user for the past sessions by analyzing the `last` command output. It helps system administrators track how long each user was logged in.

## 📜 Script Name
`task28_login_time_reporter.sh`

## 🔧 What It Does
- Reads system login history using the `last` command
- Calculates login session durations in **minutes**
- Groups and totals time per user
- Outputs a summary report

## ▶️ How to Run

```bash
chmod +x task28_login_time_reporter.sh
./task28_login_time_reporter.sh
