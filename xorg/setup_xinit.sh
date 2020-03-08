#!/bin/bash
echo -e "Setting up Xinit"

if [ "$(whoami)" == "root" ]
then
    echo -e "Do not run this script as root"
    exit 1
fi

userdir="$HOME"

echo -e "--> Moving all existing files to *.old"
mv $userdir/.xinitrc $userdir/.xinitrc.old > /dev/null 2>&1
mv $userdir/.xorg $userdir/.xorg.old > /dev/null 2>&1

echo -e "--> Linking files to repository"
mkdir -p $userdir/.xorg
ln -s $PWD/.xinitrc $userdir/.xinitrc
ln -s $PWD/status_functions.sh $userdir/.xorg/status_functions.sh

if [ "$1" == "-d" ]
then
    echo -e "--> Deleting old files"
    rm -f $userdir/.xinitrc.old
    rm -f $userdir/.xorg.old
fi

echo -e "--> Done"
