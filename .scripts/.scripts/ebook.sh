#!/bin/sh

ls -R $DATA/ebook | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' |grep -e '.pdf' -e '.epub' | grep -o "ebook/.*" | cut -b 7- | rofi -fullscreen -dmenu -p " Books" -i | xargs -I {} -d '\n' --no-run-if-empty zathura /run/media/shivam/Data/ebook/{}
