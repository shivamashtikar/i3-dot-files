#!/bin/sh
TIME=$(date "+%H:%M")
DATE=$(date "+%a, %b %d ")
echo -n "$(printf '%b' "\uf017") $TIME  $(printf '%b' "\uf073") $DATE"
