#!/bin/bash
echo -e "Setting up dwm"

if [ "$(whoami)" == "root" ]
then
    echo -e "Do not run this script as root"
    exit 1
fi

mkdir -p $HOME/.config/dwm
userdir="$HOME/.config/dwm"

echo -e "--> Moving all existing files to *.old"
mv $userdir/autostart.sh $userdir/autostart.sh.old > /dev/null 2>&1
mv $userdir/autostart_blocking.sh $userdir/autostart_blocking.sh.old > /dev/null 2>&1

echo -e "--> Linking files to repository"
ln -s $PWD/config/autostart.sh $userdir/autostart.sh
ln -s $PWD/config/autostart_blocking.sh $userdir/autostart_blocking.sh

if [ "$1" == "-d" ]
then
    echo -e "--> Deleting old files"
    rm -f $userdir/autostart.sh.old
    rm -f $userdir/autostart_blocking.sh.old
fi

echo -e "--> Done"
