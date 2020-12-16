#!/bin/sh
prevDis=`xrandr | grep -o " connected " | wc -w `
xrandr --auto
dis=`xrandr | grep -o " connected " | wc -w `
if [[ $dis -eq 3 ]]; then
  sh $HOME/.screenlayout/Triple-setup.sh
  sh $HOME/.config/polybar/launch.sh
  cp $HOME/.config/nitrogen/bg-saved-triple.cfg  $HOME/.config/nitrogen/bg-saved.cfg
  nitrogen --restore
else if [[  $dis -eq 2 ]]; then
  d1=`xrandr | grep  " connected " | head -1 | awk '{ print $1 }'`
  d2=`xrandr | grep  " connected " | tail -1 | awk '{ print $1 }'`
  cp $HOME/.config/nitrogen/bg-saved-multiple.cfg  $HOME/.config/nitrogen/bg-saved.cfg
  #xrandr --output $d1 --auto --below $d2
  sh $HOME/.screenlayout/dual-screen.sh
  nitrogen --restore
  sh $HOME/.config/polybar/launch.sh
  sleep 2
  notify-send -i '$HOME/.scripts/icons/computer.png' 'External Monitor Connected' 'Vertically above'
else
  cp $HOME/.config/nitrogen/bg-saved-single.cfg  $HOME/.config/nitrogen/bg-saved.cfg
  nitrogen --restore
  sh $HOME/.config/polybar/launch.sh
  sleep 2
  notify-send -i $HOME/.scripts/icons/pacman.png 'Single Screen' 'Happy Coding :)'
fi
fi
