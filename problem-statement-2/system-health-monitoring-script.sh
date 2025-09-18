#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Log file
LOG_FILE="/var/log/system_health.log"

# Function to log and alert
alert() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{usage=100-$8} END {print int(usage)}')
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    alert "WARNING: CPU usage is high: ${CPU_USAGE}%"
fi

# Memory Usage
MEM_USAGE=$(free | awk '/Mem/{printf "%d", $3/$2 * 100}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    alert "WARNING: Memory usage is high: ${MEM_USAGE}%"
fi

# Disk Usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    alert "WARNING: Disk usage is high: ${DISK_USAGE}%"
fi

# Running Processes Check (for example, checking if nginx is running)
PROCESS="nginx"
if ! pgrep -x "$PROCESS" > /dev/null; then
    alert "WARNING: Process $PROCESS is not running!"
fi
