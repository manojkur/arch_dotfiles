#!/bin/bash
echo -e "Setting up Zsh"

if [ "$(whoami)" == "root" ]
then
    echo -e "Do not run this script as root"
    exit 1
fi

sysdir="/etc/zsh"

mkdir -p $HOME/.config/zsh
userdir="$HOME/.config/zsh"

sudo mkdir -p /root/.config/zsh
rootdir="/root/.config/zsh"

echo -e "--> Moving all existing files to *.old"
sudo mv $sysdir/zlogin $sysdir/zlogin.old > /dev/null 2>&1
sudo mv $sysdir/zlogout $sysdir/zlogout.old > /dev/null 2>&1
sudo mv $sysdir/zprofile $sysdir/zprofile.old > /dev/null 2>&1
sudo mv $sysdir/zshenv $sysdir/zshenv.old > /dev/null 2>&1
sudo mv $sysdir/zshrc $sysdir/zshrc.old > /dev/null 2>&1

mv $userdir/.zlogin $userdir/.zlogin.old > /dev/null 2>&1
mv $userdir/.zlogout $userdir/.zlogout.old > /dev/null 2>&1
mv $userdir/.zprofile $userdir/.zprofile.old > /dev/null 2>&1
mv $userdir/.zshenv $userdir/.zshenv.old > /dev/null 2>&1
mv $userdir/.zshrc $userdir/.zshrc.old > /dev/null 2>&1

sudo mv $rootdir/.zlogin $rootdir/.zlogin.old > /dev/null 2>&1
sudo mv $rootdir/.zlogout $rootdir/.zlogout.old > /dev/null 2>&1
sudo mv $rootdir/.zprofile $rootdir/.zprofile.old > /dev/null 2>&1
sudo mv $rootdir/.zshenv $rootdir/.zshenv.old > /dev/null 2>&1
sudo mv $rootdir/.zshrc $rootdir/.zshrc.old > /dev/null 2>&1

echo -e "--> Linking files to repository"
sudo ln -s $PWD/etc/zlogin $sysdir/zlogin
sudo ln -s $PWD/etc/zlogout $sysdir/zlogout
sudo ln -s $PWD/etc/zprofile $sysdir/zprofile
sudo ln -s $PWD/etc/zshenv $sysdir/zshenv
sudo ln -s $PWD/etc/zshrc $sysdir/zshrc

ln -s $PWD/user/.zlogin $userdir/.zlogin
ln -s $PWD/user/.zlogout $userdir/.zlogout
ln -s $PWD/user/.zprofile $userdir/.zprofile
ln -s $PWD/user/.zshenv $userdir/.zshenv
ln -s $PWD/user/.zshrc $userdir/.zshrc

sudo ln -s $PWD/user/.zlogin $rootdir/.zlogin
sudo ln -s $PWD/user/.zlogout $rootdir/.zlogout
sudo ln -s $PWD/user/.zprofile $rootdir/.zprofile
sudo ln -s $PWD/user/.zshenv $rootdir/.zshenv
sudo ln -s $PWD/user/.zshrc $rootdir/.zshrc

if [ "$1" == "-d" ]
then
    echo -e "--> Deleting old files"
    sudo rm -f $sysdir/zlogin.old
    sudo rm -f $sysdir/zlogout.old
    sudo rm -f $sysdir/zprofile.old
    sudo rm -f $sysdir/zshenv.old
    sudo rm -f $sysdir/zshrc.old

    rm -f $userdir/.zlogin.old
    rm -f $userdir/.zlogout.old
    rm -f $userdir/.zprofile.old
    rm -f $userdir/.zshenv.old
    rm -f $userdir/.zshrc.old

    sudo rm -f $rootdir/.zlogin.old
    sudo rm -f $rootdir/.zlogout.old
    sudo rm -f $rootdir/.zprofile.old
    sudo rm -f $rootdir/.zshenv.old
    sudo rm -f $rootdir/.zshrc.old
fi

echo -e "--> Done"
