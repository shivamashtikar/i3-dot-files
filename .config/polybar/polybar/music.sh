#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#FFFFFF}$metadata%{F-}"
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#999}$metadata%{F-}"
else
    echo ""
fi