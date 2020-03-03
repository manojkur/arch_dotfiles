#!/bin/bash
echo -e "Installing dotfiles"

dir="$( cd "$(dirname "$0")" ; pwd -P )"

echo -e "--> Pulling git repo"
cd $dir 
git pull
cd -

# Setup Zsh
source $dir/zsh/setup_zsh.sh

# Setup Vim
source $dir/vim/setup_vim.sh

echo -e "\n--> Moving all exiting dotfiles to *.old"
mv ~/.tmux.conf ~/.tmux.conf.old > /dev/null
mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.old > /dev/null
mv ~/.config/zathura/zathurarc ~/.config/zathura/zathurarc.old > /dev/null

echo -e "\n--> Linking dotfiles to repository "
ln -s $dir/tmux/.tmux.conf ~/.tmux.conf 
ln -s $dir/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s $dir/zathura/zathurarc ~/.config/zathura/zathurarc

echo -e "\n--> Installing Plugins\n"
source $dir/update.sh

if [ "$1" == "-d" ] 
then
    echo -e "\n--> Deleting old dotfiles"
    rm ~/.tmux.conf.old  ~/.config/ranger/rc.conf.old ~/.config/termite/config.old -rf
fi
