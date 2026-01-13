#!/bin/bash

STEP=10

if [ "$1" == "up" ]; then
    brightnessctl set +5%
    
    
    ddcutil setvcp 10 + $STEP &

elif [ "$1" == "down" ]; then
    brightnessctl set 5%-

    ddcutil setvcp 10 - $STEP &
fi
