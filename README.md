# Linux System Administration – Shell Scripting Project

This project contains five shell scripts written as part of a Linux System Administration assignment. Each script solves a real-world system task like user management, kernel checking, login tracking, and more.

## ✅ Included Tasks

### 1. Task 43 – Extract Usernames from /etc/passwd
- Extracts all usernames from the `/etc/passwd` file.
- Saves the output to `userlist.txt`.

### 2. Task 44 – System Boot History Summary
- Displays the 5 most recent system reboots.
- Uses the `last reboot` command.
- Output saved to `boot_history_report.txt`.

### 3. Task 45 – Failed Login Attempts
- Shows the last 10 failed SSH login attempts from system logs.
- Works with `/var/log/auth.log` or `/var/log/secure`.

### 4. Task 15 – Kernel Version Checker
- Compares the current running kernel version with the latest available.
- Supports Debian, RHEL, and Arch Linux.
- Logs the result to `/var/log/kernel_version_check.log`.

### 5. Task 28 – Login Time Reporter
- Calculates total login time (in minutes) for each user.
- Parses `last` command output.
- Saves the summary to `weekly_login_report.txt`.

---

## ▶️ How to Run

For each script:

```bash
chmod +x script_name.sh
./script_name.sh
