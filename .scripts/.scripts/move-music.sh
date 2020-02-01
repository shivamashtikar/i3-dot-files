#!/bin/sh
{
	mv "$(echo `dbus-send --print-reply --dest=org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | egrep -A 1 "url" |cut -b 51- | cut -d '"' -f 1 `)" /run/media/shivam/Data/Music/sorted/ && 
		notify-send -i '~/.scripts/music.png' "$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | egrep -A 1 "title" |cut -b 44- | cut -d '"' -f 1 )" "moved to sorted"
} || {
	notify-send -i "~/.scripts/cancel.png" "already moved"
}

