#!/bin/bash

if [ -e /sys/class/power_supply/BAT0 ]; then
    CAPACITY=$( cat /sys/class/power_supply/BAT0/uevent | grep -i capacity | cut -d'=' -f2 )
    case $CAPACITY in [0-9]|11)
        # send warning and suspend only if battery is discharging
        STATUS=$(cat /sys/class/power_supply/BAT0/uevent | grep -i status | cut -d'=' -f2 )
        if [ $(echo $STATUS) == "Discharging" ]; then
            breanotify-send --urgency=critical --icon=dialog-warning "LOW BATTERY! SUSPENDING IN 30 sec"
        fi;;
    *);;
    esac
fi

