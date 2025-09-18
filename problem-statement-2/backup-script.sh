#!/bin/bash

# CONFIG
SRC_DIR="/path/to/source"
REMOTE="user@remote.server.com:/path/to/destination"
LOG_FILE="/var/log/backup.log"

# Start backup
echo "$(date) - Starting backup" >> $LOG_FILE
scp -r "$SRC_DIR" "$REMOTE"

# Check result
if [ $? -eq 0 ]; then
    echo "$(date) - Backup SUCCESS" >> $LOG_FILE
else
    echo "$(date) - Backup FAILED" >> $LOG_FILE
fi
