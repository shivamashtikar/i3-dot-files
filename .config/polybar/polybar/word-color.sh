#!/bin/sh
image=$(cat ~/.config/nitrogen/bg-saved.cfg  | grep 'file=' | cut -b 6- | tr -d '\n')
color=$(convert "$image" -gravity center -crop 1280x300+0-600 +repage -colorspace hsb -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');

#echo $color	
value="60" #brightness value to compare to
if [[ $color -gt $value ]]; then #white background image and black text
	sed -i 's/poly-color:#ffffff/poly-color:#000000/g' ~/.Xresources
	sed -i "s/color1 = '#FD7980'/color1 = '#FF0000'/g" ~/.config/conky/conky-froly.conf
	sed -i "s/color6 = '#FFFFFF'/color6 = '#000000'/g" ~/.config/conky/conky-froly.conf
else
	sed -i 's/poly-color:#000000/poly-color:#ffffff/g' ~/.Xresources
	sed -i "s/color6 = '#000000'/color6 = '#FFFFFF'/g" ~/.config/conky/conky-froly.conf
	sed -i "s/color1 = '#FF0000'/color1 = '#FD7980'/g" ~/.config/conky/conky-froly.conf
fi

xrdb ~/.Xresources
