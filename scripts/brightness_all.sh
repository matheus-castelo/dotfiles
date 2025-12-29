#!/bin/bash

# Define o passo (10% é melhor para monitores externos pq eles são lentos)
STEP=10

if [ "$1" == "up" ]; then
    # 1. Aumenta Notebook (Instantâneo)
    brightnessctl set +5%
    
    # 2. Aumenta Monitor Samsung (Em segundo plano para não travar a barra)
    # setvcp 10 é o código universal para brilho
    ddcutil setvcp 10 + $STEP &

elif [ "$1" == "down" ]; then
    # 1. Diminui Notebook
    brightnessctl set 5%-

    # 2. Diminui Monitor Samsung
    ddcutil setvcp 10 - $STEP &
fi