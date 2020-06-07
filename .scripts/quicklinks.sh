#!/usr/bin/env bash

LINKS=$HOME/.scripts/links.txt


url="$(cat $LINKS | rofi -i -dmenu -matching fuzzy -no-custom)"

if [[ -n $url ]]
then
  firefox --new-tab $url
fi

