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

is_on_ac_power() {
    upower -i $(upower -e | grep 'line_power') | grep -q "state:\s*charging\|state:\s*fully-charged"
    return $?
}
is_external_monitor_connected() {
    swaymsg -t get_outputs | grep -q "HDMI\|DP"
    return $?
}

if is_on_ac_power; then
    powerprofilesctl set performance
else
    powerprofilesctl set balanced
fi
