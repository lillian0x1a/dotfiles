#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT0"
CAPACITY=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status")

notify-send "🔋 Battery Status" "Battery: ${CAPACITY}% (${STATUS})"
