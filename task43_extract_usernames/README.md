# Task 43 – Extract Usernames from /etc/passwd

This script is part of a Linux System Administration project and performs a simple yet useful task: **extracting all usernames** from the `/etc/passwd` file and saving them to a separate list.

## 📜 Script Name
`task43_extract_usernames.sh`

## 🔧 What It Does
- Reads the system's `/etc/passwd` file
- Extracts the **first field** (i.e., the usernames)
- Saves the usernames to a file named `userlist.txt`
- Optionally logs the extraction details to `/var/log/user_extract.log`

## 🛡️ Features
- Error handling for missing or unreadable `/etc/passwd`
- Inline comments for clarity
- Logs the number of users extracted (if permission allows)

## ▶️ How to Run

```bash
chmod +x task43_extract_usernames.sh
./task43_extract_usernames.sh

