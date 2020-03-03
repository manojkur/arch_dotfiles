#!/bin/bash
echo -e "Installing Zsh"

sysdir="/etc/zsh"

mkdir -p $HOME/.config/zsh
userdir="$HOME/.config/zsh"

echo -e "--> Moving all existing files to *.old"
mv $sysdir/zlogin $sysdir/zlogin.old > /dev/null 2>&1
mv $sysdir/zlogout $sysdir/zlogout.old > /dev/null 2>&1
mv $sysdir/zprofile $sysdir/zprofile.old > /dev/null 2>&1
mv $sysdir/zshenv $sysdir/zshenv.old > /dev/null 2>&1
mv $sysdir/zshrc $sysdir/zshrc.old > /dev/null 2>&1

mv $userdir/.zlogin $userdir/.zlogin.old > /dev/null 2>&1
mv $userdir/.zlogout $userdir/.zlogout.old > /dev/null 2>&1
mv $userdir/.zprofile $userdir/.zprofile.old > /dev/null 2>&1
mv $userdir/.zshenv $userdir/.zshenv.old > /dev/null 2>&1
mv $userdir/.zshrc $userdir/.zshrc.old > /dev/null 2>&1

echo -e "--> Linking files to repository"
ln -s $PWD/etc/zlogin $sysdir/zlogin
ln -s $PWD/etc/zlogout $sysdir/zlogout
ln -s $PWD/etc/zprofile $sysdir/zprofile
ln -s $PWD/etc/zshenv $sysdir/zshenv
ln -s $PWD/etc/zshrc $sysdir/zshrc

ln -s $PWD/user/.zlogin $userdir/.zlogin
ln -s $PWD/user/.zlogout $userdir/.zlogout
ln -s $PWD/user/.zprofile $userdir/.zprofile
ln -s $PWD/user/.zshenv $userdir/.zshenv
ln -s $PWD/user/.zshrc $userdir/.zshrc

if [ "$1" == "-d" ]
then
    echo -e "--> Deleting old files"
    rm -f $sysdir/zlogin.old
    rm -f $sysdir/zlogout.old
    rm -f $sysdir/zprofile.old
    rm -f $sysdir/zshenv.old
    rm -f $sysdir/zshrc.old

    rm -f $userdir/.zlogin.old
    rm -f $userdir/.zlogout.old
    rm -f $userdir/.zprofile.old
    rm -f $userdir/.zshenv.old
    rm -f $userdir/.zshrc.old
fi

echo -e "--> Done"
