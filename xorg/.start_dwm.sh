#!/bin/bash

# start dwm

xset -dpms
xrandr
xrandr --output HDMI1 --primary --auto --output DP2 --auto --left-of HDMI1 --output eDP1 --auto --left-of DP2
/usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1 
done &
while /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
do
    sleep 300 
done &
xcompmgr &
exec dwm
