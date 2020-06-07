#!/bin/bash
MODE="light" # Default mode

KITTY_LIGHT_THEME="$HOME/.config/kitty/Piatto_Light.conf"
KITTY_DARK_THEME="$HOME/.config/kitty/3024_Night.conf"

# Destination file
KITTY_THEME="$HOME/.config/kitty/theme.conf"

# Cache file to store state
CACHE_FILE="/tmp/system_color_scheme.tmp"

function toggle_mode(){
  if [[ -f $CACHE_FILE ]]
  then
    if grep -q "dark" $CACHE_FILE ;
    then
        MODE="light"
    else
          MODE="dark"
    fi
  fi
  echo "Hello"
}
#Passed arguments
while getopts "ldt" opt; do
  case $opt in
    l) MODE="light"
    ;;
    d) MODE="dark"
    ;;
    t) toggle_mode
      ;;
    \?) echo "Invalid option -$OPTARG" >&2 && exit 1
    ;;
  esac
done


echo "export SYSTEM_COLOR_SCHEME='$MODE'" > $CACHE_FILE
if [[ -L "$KITTY_THEME"  ]]
  then
    CURRENT_LINK=`file $KITTY_THEME | cut -d " " -f5`
    if [[ $CURRENT_LINK != $KITTY_LIGHT_THEME && $MODE == "light" ]]
      then
        rm $KITTY_THEME
        ln -s $KITTY_LIGHT_THEME $KITTY_THEME
    elif [[ $CURRENT_LINK != $KITTY_DARK_THEME && $MODE == "dark" ]]
      then
        rm $KITTY_THEME
        ln -s $KITTY_DARK_THEME $KITTY_THEME
    fi
  else
    [ -f $KITTY_THEME ] && rm $KITTY_THEME
    if [[ $MODE = "light" ]]
    then
      ln -s $KITTY_LIGHT_THEME $KITTY_THEME
    else
      ln -s $KITTY_DARK_THEME $KITTY_THEME
    fi
fi
