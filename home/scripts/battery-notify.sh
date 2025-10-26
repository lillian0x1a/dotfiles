#!/usr/bin/env bash

# Kill any existing processes of this script
pkill -f --older 1 'battery_notify.sh' || true

while true; do
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    battery_charge=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$battery_status" = "Discharging" ]; then
        if [ "$battery_charge" -le 15 ]; then
            notify-send --urgency=critical "Battery Critically Low!" "${battery_charge}% remaining. Please plug in." -i battery-low
            sleep 60  # Wait for 1 minutes
        elif [ "$battery_charge" -le 25 ]; then
            notify-send --urgency=normal "Battery Low" "${battery_charge}% remaining." -i battery-low
            sleep 180  # Wait for 3 minutes
        fi
    fi
    sleep 600  # Normal check interval (10 minutes)
done