# Task 15 – Kernel Version Checker

This script checks whether the currently running kernel is up to date with the latest version available in the system’s package manager. It works on Debian/Ubuntu, RHEL/CentOS, and Arch Linux.

## 📜 Script Name
`task15_kernel_version_checker.sh`

## 🔧 What It Does
- Detects your Linux distribution (Debian, RHEL, or Arch)
- Finds the current running kernel version
- Compares it with the latest available kernel from the package manager
- Shows a message if an update is available
- Logs all details to `/var/log/kernel_version_check.log`

## ▶️ How to Run

```bash
chmod +x task15_kernel_version_checker.sh
sudo ./task15_kernel_version_checker.sh
