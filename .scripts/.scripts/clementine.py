#!/usr/bin/python2

import os
from shutil import move,copyfile
import dbus
import notify2

# Clementine lives on the Session bus
session_bus = dbus.SessionBus()

# Get Clementine's player object, and then get an interface from that object,
# otherwise we'd have to type out the full interface name on every method call.
#player = session_bus.get_object('org.mpris.clementine', '/Player')
#iface = dbus.Interface(player, dbus_interface='org.freedesktop.MediaPlayer')

bashCommand = "qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata"
import subprocess
process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()
musicLoc = output.split('url: ')[1][7:].split('\n')[0]

titleName = output.split('title: ')[1].split('\n')[0]
# Call a method on the interface
#metadata = iface.GetMetadata()
#titleName = metadata["title"]
#print metadata["artist"]
#musicLoc = metadata["location"][7:]

move(musicLoc,'/run/media/shivam/Data/Music/sorted/'+musicLoc.split('/')[-1])

ICON_PATH =u'file:///home/shivam/.scripts/music.png'


# initialise the d-bus connection
notify2.init("Music Notifier")

# create Notification object
n = notify2.Notification(None, icon = ICON_PATH)

# set urgency level
n.set_urgency(notify2.URGENCY_NORMAL)

# set timeout for a notification
n.set_timeout(2000)
n.update('Music Moved',titleName)
n.show()
