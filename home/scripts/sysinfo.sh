#!/usr/bin/env bash

# --- CPU使用率 ---
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')

# --- メモリ使用量 ---
MEM_INFO=$(free -h | awk 'NR==2{printf "Used: %s / %s (%.2f%%)", $3,$2,$3*100/$2}')

# --- ディスク使用量 (ルートディレクトリ) ---
DISK_INFO=$(df -h / | awk 'NR==2 {printf "Used: %s / %s (%s)", $3, $2, $5}')

# --- バッテリー情報 ---
BAT_PATH="/sys/class/power_supply/BAT0"
if [ -d "$BAT_PATH" ]; then
    BAT_LEVEL=$(cat "$BAT_PATH/capacity")
    BAT_STATUS=$(cat "$BAT_PATH/status")
    BATTERY_INFO="Battery: ${BAT_LEVEL}% (${BAT_STATUS})"
else
    BATTERY_INFO="Battery: Not Found (Desktop?)"
fi

# --- ネットワーク接続 ---
if ip route | grep -q default; then
    NETWORK_INFO="Network: Connected"
else
    NETWORK_INFO="Network: Disconnected"
fi

# --- システム起動時間 ---
if uptime -p > /dev/null 2>&1; then
    UPTIME=$(uptime -p)
else
    UPTIME=$(uptime | awk -F'up' '{print "up" $2}' | cut -d',' -f1)
fi

# --- 通知メッセージを一つの変数にまとめる ---
# \n は改行文字を意味します
MESSAGE="🖥️  CPU: ${CPU_USAGE}\n🧠  Memory: ${MEM_INFO}\n💾  Disk: ${DISK_INFO}\n🔋  ${BATTERY_INFO}\n🌐  ${NETWORK_INFO}\n⏱️  ${UPTIME}"

# --- デバッグ用：生成されたメッセージをターミナルに表示 ---
# この行があれば、スクリプトを実行したときに何が作られたか分かります
echo "--- Generated Message ---"
echo -e "$MESSAGE"
echo "------------------------"

# --- 通知として表示 ---
notify-send -a "SystemInfo" "System Information" "$MESSAGE"