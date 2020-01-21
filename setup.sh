#!/bin/bash
echo -e "Installing dotfiles"

dir="$( cd "$(dirname "$0")" ; pwd -P )"

echo -e "--> Pulling git repo"
cd $dir 
git pull
cd -

echo -e "\n--> Moving all exiting dotfiles to *.old"
mv ~/.bashrc ~/.bashrc.old > /dev/null
mv ~/.bash_profile ~/.bash_profile.old > /dev/null
mv ~/.profile ~/.profile.old > /dev/null
mv ~/.zshrc ~/.zshrc.old > /dev/null
mv ~/.vimrc ~/.vimrc.old > /dev/null
mv ~/.vimextras ~/.vimextras.old > /dev/null
mv ~/.tmux.conf ~/.tmux.conf.old > /dev/null
mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.old > /dev/null
mv ~/.config/zathura/zathurarc ~/.config/zathura/zathurarc.old > /dev/null

echo -e "\n--> Linking dotfiles to repository "
ln -s $dir/bash/.bashrc ~/.bashrc 
ln -s $dir/bash/.bash_profile ~/.bash_profile
ln -s $dir/bash/.profile ~/.profile
ln -s $dir/zsh/.zshrc ~/.zshrc 
ln -s $dir/vim/.vimrc ~/.vimrc 
ln -s $dir/vim/.vimextras ~/.vimextras 
ln -s $dir/tmux/.tmux.conf ~/.tmux.conf 
ln -s $dir/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s $dir/zathura/zathurarc ~/.config/zathura/zathurarc

# # Installing Vundle (Vim plugin manager)
# VUNDLE=~/.vim/bundle/Vundle.vim
# if [ -d "$VUNDLE" ]; then
#     echo -e "\n--> Vundle already installed. Skiping..."
# else 
#     echo -e "\n--> Installing Vundle (Vim plugin manager)\n"
#     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | sed "s/^/  /g"
# fi
# 
# mkdir -p ~/.vim/UltiSnips
# ln -s $dir/snippets/* ~/.vim/UltiSnips/ 
# 
# # Installing TPM (TMUX plugin manager)
# TPM=~/.tmux/plugins/tpm
# if [ -d "$TPM" ]; then
#     echo -e "\n--> TPM already installed. Skiping..."
# else 
#     echo -e "\n--> Installing TPM (TMUX plugin manager)\n"
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm | sed "s/^/  /g"
# fi
# echo -e "\n--> Reloading Tmux"
# tmux source ~/.tmux.conf
# 
# echo -e "\n--> Installing Plugins\n"
# source $dir/update.sh
# 
# if [ "$1" == "-d" ] 
# then
#     echo -e "\n--> Deleting old dotfiles"
#     rm ~/.bashrc.old ~/.zshrc.old ~/.vimrc.old ~/.vimextras.old ~/.tmux.conf.old  ~/.config/ranger/rc.conf.old ~/.config/termite/config.old -rf
# fi
