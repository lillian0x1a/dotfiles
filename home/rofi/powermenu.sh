#!/usr/bin/env bash

# Options
shutdown="\tShutdown"
reboot="\tReboot"
lock="\tLock"
suspend="\tSuspend"
logout="\tLogout"

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu
}

# Execute Command
run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--suspend' ]]; then
		mpc -q pause
		amixer set Master mute 
		systemctl suspend
	elif [[ $1 == '--logout' ]]; then
		if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
			bspc quit
		elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
			i3-msg exit
		elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
			qdbus org.kde.ksmserver /KSMServer logout 0 0 0
		fi
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    *Shutdown)
		run_cmd --shutdown
        ;;
    *Reboot)
		run_cmd --reboot
        ;;
    *Lock)
		# if [[ -x '/usr/bin/betterlockscreen' ]]; then
		# 	betterlockscreen -l
		# elif [[ -x '/usr/bin/i3lock' ]]; then
		# 	i3lock
		# fi
		hyprlock
        ;;
    *Suspend)
		run_cmd --suspend
        ;;
    *Logout)
		run_cmd --logout
        ;;
esac