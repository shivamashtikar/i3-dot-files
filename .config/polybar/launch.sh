#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example  &
#polybar bar2 &
#$HOME/.config/polybar/word-color.sh

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d' ' -f1); do
    CUR_DISPLAY_RESOLUTION=$(xrandr --query | grep -w "$m" | cut -d' ' -f3)
    if echo $CUR_DISPLAY_RESOLUTION | grep -q "primary" ; then
      MONITOR=$m polybar example &
    else
      M_WIDTH=$(echo $CUR_DISPLAY_RESOLUTION | cut -d'+' -f1 | cut -d'x' -f1)
      M_HEIGHT=$(echo $CUR_DISPLAY_RESOLUTION | cut -d'+' -f1 | cut -d'x' -f2)

      if [ "$M_WIDTH" -gt "$M_HEIGHT" ]; then
        echo "$M_WIDTH, $M_HEIGHT"
        MONITOR=$m polybar example &
      else
        MONITOR=$m polybar vertical-monitor &
      fi
    fi
  done
else
  polybar --reload example &
fi


echo "Bars launched..."
