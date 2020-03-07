#!/bin/bash
echo -e "Setting up Vim"

if [ "$(whoami)" == "root" ]
then
    echo -e "Do not run this script as root"
    exit 1
fi

sysdir="/etc"
userdir="$HOME"

echo -e "--> Moving all existing files to *.old"
mv $userdir/.vimrc $userdir/.vimrc.old > /dev/null 2>&1

echo -e "--> Linking files to repository"
ln -s $PWD/.vimrc $userdir/.vimrc

VUNDLE=~/.vim/bundle/Vundle.vim
if [ -d "$VUNDLE" ]; then
    echo -e "\n--> Vundle already installed. Skiping..."
else 
    echo -e "\n--> Installing Vundle (Vim plugin manager)\n"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | sed "s/^/  /g"
fi

if [ "$1" == "-d" ]
then
    echo -e "--> Deleting old files"
    rm -f $userdir/.vimrc.old
fi

echo -e "--> Done"
