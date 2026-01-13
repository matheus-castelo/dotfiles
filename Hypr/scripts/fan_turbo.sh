#!/bin/bash

STATE_FILE="/tmp/fan_mode"

if [ ! -f "$STATE_FILE" ]; then
    echo "auto" > "$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [ "$CURRENT" == "auto" ]; then
   
    pkexec sh -c "dell-bios-fan-control 0 && i8kfan 2 2"
    echo "turbo" > "$STATE_FILE"
    notify-send -u critical "MODE: TURBO ✈️" "Ventoinhas no máximo!"
else
   
    pkexec dell-bios-fan-control 1
    echo "auto" > "$STATE_FILE"
    notify-send -u low "MODE: AUTO 🍃" "Controle devolvido à BIOS"
fi
