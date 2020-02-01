#!/bin/sh


if  pgrep -x "clementine" > /dev/null ;
then
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.sayonara /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | egrep -A 1 "title" | grep variant |awk -F '"' '{print $2}'
elif pgrep -x "sayonara" > /dev/null ;
then
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.sayonara /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | egrep -A 1 "title" | grep variant |awk -F '"' '{print $2}'
fi

