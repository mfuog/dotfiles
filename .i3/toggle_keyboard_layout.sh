#!/bin/bash

CURRENT=`setxkbmap -query | awk '
    BEGIN{layout="";variant=""}
    /^layout/{layout=$2}
    /^variant/{variant=$2}
    END{printf("%s%s",layout,variant)}'`
if [[ $CURRENT == "de" ]]
then
    setxkbmap us
    notify-send "keyboard layout changed to US."
else
    setxkbmap de
    notify-send "keyboard layout changed to DE."
fi

