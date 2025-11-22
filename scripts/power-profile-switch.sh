#!/bin/bash

PROFILE_AC="performance"
PROFILE_BATTERY="power-saver"

check_power_status() {
    if cat /sys/class/power_supply/AC*/online 2>/dev/null | grep -q 1; then
        echo "ac"
    else
        echo "battery"
    fi
}

change_profile() {
    local profile=$1
    powerprofilesctl set "$profile"
}

POWER_STATUS=$(check_power_status)
if [ "$POWER_STATUS" = "ac" ]; then
    change_profile "$PROFILE_AC"
else
    change_profile "$PROFILE_BATTERY"
fi
