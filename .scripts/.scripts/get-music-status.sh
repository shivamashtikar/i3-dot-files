if  ~/.scripts/get-music.sh | grep -q ".*"; 
then
 if playerctl status | grep -q "Playing";
  then
    echo " `sh ~/.scripts/get-music.sh |  cut -c -30`";
  else
    echo " `sh ~/.scripts/get-music.sh |  cut -c -30`";
  fi 
else
	echo ""
fi
