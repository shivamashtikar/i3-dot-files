#!/usr/bin/env bash

MUSICDIR="$HOME/Music/lightning"
DEVICEDIR="/sdcard/Music/Collection"

# Creates directory only if it doesn't exists
adb shell mkdir -p $DEVICEDIR

# Colors
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# For loop uses $IFS variable to determine what the field separators are.
# By default $IFS is set to the space character.
# We'll set it to newline character.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

dArray=($( adb shell ls -A $DEVICEDIR ))
mArray=($(ls $MUSICDIR))

newArray=()
for ((i = 0; i < ${#mArray[@]}; i++)) do
    skip=
    for ((j = 0; j < ${#dArray[@]}; j++)) do
        [[ "${mArray[$i]}" == "${dArray[$j]}" ]] && { skip=1; break; }
    done
    [[ -n $skip ]] || newArray+=("${mArray[$i]}")
done

printf "%s\n" "${grn} Found ${#newArray[@]} new files in $MUSICDIR ${end}"

# for ((j = 0; j < ${#newArray[@]}; j++)) do
#   echo "${newArray[$j]}"
# done


for ((i = 0; i < ${#newArray[@]}; i++))
do
  printf "%s\n" "${yel} Sending : ${newArray[$i]} ${end}"
  adb push "$MUSICDIR/${newArray[$i]}" $DEVICEDIR
  # echo "Added : ${newArray[$i]}"
   # printf "%s \n" "${newArray[$i]}"
done
IFS=$SAVEIFS


