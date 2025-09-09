#!/bin/sh

case $1 in
    pre)
        # Qui i comandi da eseguire prima di andare in sospensione
        exit 0
        ;;
    post)
        # Qui i comandi da eseguire al risveglio
        echo 0 > /sys/class/leds/tpacpi::power/brightness
        echo 0 > /sys/class/leds/tpacpi::lid_logo_dot/brightness
        ;;
esac

