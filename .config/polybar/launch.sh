#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch mybar
echo "---" | tee -a /tmp/polybar1.log 

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar --config=/home/peccary/.config/polybar/config.ini &
  done
else
  polybar --reload mybar --config=/home/peccary/.config/polybar/config.ini &
fi
# polybar --config=config.ini mybar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
