#! /bin/sh


chosen=$(printf "Power Off\nRestart\nLock\nLogout" | rofi -dmenu -i -theme "gruvbox-dark" -font "Hack NF 20")

case "$chosen" in
    "Power Off") poweroff ;;
    "Restart") reboot ;;
    "Lock") slock ;;
    "Logout") logout ;;
    *) exit 1;;
esac
