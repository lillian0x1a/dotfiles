#!/usr/bin/env bash

# --- Current Time ---
CLOCK="$(date '+%Y-%m-%d %H:%M:%S')"

# --- CPU Usage ---
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')

# --- Memory Usage ---
MEM_INFO=$(free -h | awk 'NR==2{printf "Used: %s / %s (%.2f%%)", $3,$2,$3*100/$2}')

# --- Disk Usage (Root Directory) ---
DISK_INFO=$(df -h / | awk 'NR==2 {printf "Used: %s / %s (%s)", $3, $2, $5}')

# --- Battery Info ---
BAT_PATH="/sys/class/power_supply/BAT0"
if [ -d "$BAT_PATH" ]; then
    BAT_LEVEL=$(cat "$BAT_PATH/capacity")
    BAT_STATUS=$(cat "$BAT_PATH/status")
    BATTERY_INFO="Battery: ${BAT_LEVEL}% (${BAT_STATUS})"
else
    BATTERY_INFO="Battery: Not Found (Desktop?)"
fi

# --- Network Connection ---
if ip route | grep -q default; then
    NETWORK_INFO="Network: Connected"
else
    NETWORK_INFO="Network: Disconnected"
fi

# --- System Uptime ---
if uptime -p > /dev/null 2>&1; then
    UPTIME=$(uptime -p)
else
    UPTIME=$(uptime | awk -F'up' '{print "up" $2}' | cut -d',' -f1)
fi

# --- Format the message for readability ---
MESSAGE=$(cat <<EOF
Time: ${CLOCK}
🖥️  CPU: ${CPU_USAGE}
🧠  Memory: ${MEM_INFO}
💾  Disk: ${DISK_INFO}
🔋  ${BATTERY_INFO}
🌐  ${NETWORK_INFO}
⏱️  ${UPTIME}
EOF
)

# --- Display as a notification ---
notify-send -a "SystemInfo" "System Information" "$MESSAGE"