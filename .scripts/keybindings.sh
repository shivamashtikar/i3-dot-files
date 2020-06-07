#!/usr/bin/env sh
# script taken from https://gitlab.com/vahnrr/rofi-menus
#

list=$(i3-msg -t get_config \
    | awk -v pre_mode="<span bgcolor='#000000' fgcolor='#ff0000' weight='heavy'> " \
          -v post_mode=" </span> " \
          -v pre_keybinding="<span fgcolor='#00ff00' weight='heavy'>" \
          -v post_keybinding="</span>" \
          -v separator=" " '
$1 == "#" {
    # Strip down the indent characters
    gsub(/^\s+/, "", $0);
    comment = substr($0, 3);
}
match($0, /^[^\s]+mode ".+"/) != 0 {
    mode = pre_mode toupper(substr($2, 2, length($2)-2)) post_mode;
}
match($0, /^}/) != 0 {
    mode = "";
}
$1 == "bindsym" {
    # Strip down the $ character from variables such as $Mod
    gsub(/\$/, "", $2)
    line = pre_keybinding $2 post_keybinding separator comment;
    # Replace $num in the comment by the number found in the keybinding
    if (index(comment, "$num")) {
        gsub(/\$num/, substr($2, match($2, /([[:digit:]]+)$/), length($2)), line);
    }
    print mode line;
}')

echo "$list" \
    | rofi -dmenu \
           -markup-rows \
           -i \
           -p "i3 Keybindings" &> /dev/null

