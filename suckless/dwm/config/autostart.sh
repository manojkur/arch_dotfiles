#!/bin/bash

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1 
done &

while /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
do
    sleep 300 
done &

xcompmgr &
