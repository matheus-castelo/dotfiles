#!/bin/bash

# Arquivo temporário para guardar o estado
STATE_FILE="/tmp/fan_mode"

# Se o arquivo não existe, cria como auto
if [ ! -f "$STATE_FILE" ]; then
    echo "auto" > "$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [ "$CURRENT" == "auto" ]; then
    # ATIVAR MODO TURBO
    # 1. Desliga o controle da BIOS
    # 2. Força ventoinhas no máximo (2 2)
    pkexec sh -c "dell-bios-fan-control 0 && i8kfan 2 2"
    echo "turbo" > "$STATE_FILE"
    notify-send -u critical "MODE: TURBO ✈️" "Ventoinhas no máximo!"
else
    # ATIVAR MODO AUTOMÁTICO
    # Devolve o controle para a BIOS
    pkexec dell-bios-fan-control 1
    echo "auto" > "$STATE_FILE"
    notify-send -u low "MODE: AUTO 🍃" "Controle devolvido à BIOS"
fi
