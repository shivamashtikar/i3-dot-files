#!/bin/sh
pacmd list-sinks | grep index |  cut -b 12- | xargs -I{} pactl set-sink-mute {} toggle
