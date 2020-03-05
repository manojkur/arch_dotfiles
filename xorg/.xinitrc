#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# setup background changing systemd timer
# /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
# systemd-run --on-calendar='*:0/5' --user --unit background_wallpaper.service -- /usr/bin/feh --no-fehbg --bg-fill --randomize -recursive ~/dotfiles/backgrounds/backgrounds/
# 
# # start dwm
# while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
# do
#     sleep 1
# done &
# exec dwm
exec ~/.start_dwm.sh
