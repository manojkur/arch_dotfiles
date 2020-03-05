#!/bin/bash

# setup background changing systemd timer
# systemd-run --on-calendar='*:0/5' --user --unit background_wallpaper.service --service-type=simple -- /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/

/usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/

# start dwm
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1 
        
#    if [[ $(( $(date +"%M" | sed 's/^0*//') % 5 )) == 0 ]] && [[ $(( $(date +"%S") | sed 's/^0*//' == 0 )) ]] 
#    then
#        /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
#    fi
done &
while /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
do
    sleep 300 
done &
xcompmgr &
exec dwm
