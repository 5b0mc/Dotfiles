#!/bin/sh

if [ -z "$1" ]; then
    exit 1
fi

LID_STATE_FILE="/proc/acpi/button/lid/LID/state"
read -r LS < "$LID_STATE_FILE"
case "$LS" in
    *open)
        swaymsg output "$LAPTOP_OUTPUT" enable
        ;;
    *closed)
        swaymsg output "$LAPTOP_OUTPUT" disable
        ;;
    *) 
        exit 1 ;;
esac

