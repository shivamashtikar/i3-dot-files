#!/bin/bash

rofi -show run \
  -theme-str 'listview { enabled: false;}'\
  | xargs -I{} \
  youtube-dl --output /run/media/shivam/Data/Music/"%(title)s.%(ext)s" \
  --extract-audio --audio-format mp3 --add-metadata -x {}
