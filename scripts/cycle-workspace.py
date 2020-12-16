#!/usr/bin/env python

import i3
import sys

outputs = i3.get_outputs()
workspaces = i3.get_workspaces()

# figure out what is on, and what is currently on your screen.
workspace = list(filter(lambda s: s['focused']==True, workspaces))
output = list(filter(lambda s: s['active']==True, outputs))

# figure out the other workspace name
other_workspace = list(filter(lambda s: s['name']!=workspace[0]['output'], output))

choice = "first"
try:
  choice = sys.argv[1]
except:
  print("No arguments, will move to available workspace")

if len(other_workspace)==2:
  if choice == 'second':
    i3.command('move', 'workspace to output '+other_workspace[1]['name'])
    exit(0)

# send current to the no-active one
i3.command('move', 'workspace to output '+other_workspace[0]['name'])
