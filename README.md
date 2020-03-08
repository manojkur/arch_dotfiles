# dotfiles
## Automatic Setup
To automatically setup the dotfiles run from anywhere:
```
./setup.sh
```
This will keep the old configuration files around with a '.old' suffix

**Options:**  
-d -- Don't keep '.old' files around; i.e. completely overwrite

### Sets up:
* TODO: packages
* xorg
* suckless
    - st
    - dmenu
    - dwm
* ranger
* vim
* zsh
* tmux
* zathura
* TODO: LaTex
* TODO: directory structure

### End Goal for setup.sh:
* Install packages
    - TODO: setup_packages.sh
        - Check to make sure system is running Arch Linux
        - Run `pacman -Ss`
        - Run `pacman -Syu`
    - Install pacman packages
        - TODO: setup_pacman.sh
        - Check installed pacman packages with `pacman -Qe`
    - Install yay
        - TODO: install_yay.sh
        - Change filename
        - Add git clone to script
        - Check to see if it is already installed
    - Install packages for yay
        - TODO: setup_yay.sh
        - Check installed AUR packages with `yay -Qm`
* Install xorg
    - TODO: setup_xinit.sh
    - TODO: Setup keyboard modifications
        - Change Caps lock to ESC
    - TODO: Either automatically setup displays or be able to maintain different configurations for each computer
    - TODO: Setup default programs using xdg
* Suckless
    - TODO: install_suckless.sh
    - Install st
        - TODO: install_st.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
        - Patches to possibly apply:
            - clipboard
            - copyurl
            - delkey
            - desktopentry
            - externalpipe
            - externalpipe-signal
            - fix ime
            - iso14755
            - keyboard_select
            - newterm
            - open_copied_url
            - relativeborder
            - rightclickpaste
            - selectioncolors
            - themed_cursor
            - vertcenter
            - vimbrowse
            - xresources
    - Install dmenu
        - TODO: install_dmenu.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
    - Install dwm
        - TODO: install_dwm.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
        - Check out [dwm.suckless.org/customisation](https://dwm.suckless.org/customisation)
        - Install display manager
            - Checkout slock at [tools.suckless.org/slock](https://tools.suckless.org/slock)
        - Shortcut to launch Firefox
        - Shortcut to change wallpaper
        - Patches to possibly apply:
            - center?
            - noborder?
            - Find patches for different screen layouts
            - Find patches for better multimonitor support
            - Find patches for better statusbar layout
                - See pacman updates `checkupdates | wc -l`
                - Checkout slstatus at [tools.suckless.org/sslstatus](https://tools.suckless.org/slstatus)
            - Explore other patches
    - Install slstatus
        - TODO: install_slstatus.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
        - Clone git repo
        - Modify
    - Install slock
        - TODO: install_slock.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
        - Clone git repo
        - Modify
    - Install tabbed
        - TODO: install_tabbed.sh
            - git pull submodule
        - Add Makefile outputs to gitignore
        - Clone git repo
        - Modify
* Setup ranger
    - TODO: setup_ranger.sh
    - Explore rc.conf
* Setup vim
    - TODO: setup_vim.sh
        - Have Vundle install plugins
    - Vundle
        - Find more useful plugins to install
    - Setup dotfiles for vim
        - Setup CAPS to ESC
        - Remove E,B bindings for $,0
        - Take control of /etc/vimrc
            - Currently does `runtime! archlinux.vim`
        - Set cursorline to highlight whole line instead of underline it 
        - Make Vundle commands run only if Vundle has run PluginInstall
            - Also if terminal is st-256color
        - Be able to resize splits when terminal window is resized 
        - Better [{()}] highlighting, maybe plugin luochen1990/rainbow
        - Automatically comment text, bind to <leader><Space>
        - Change toggle highlight to <leader>h 
        - Git/change gutter before line numbers
        - Toggle minimap
        - Preview Markdown
* Setup zsh
    - TODO: setup_zsh.sh
        - Decide whether to install antigen here, or through yay
    - antigen
        - Find more useful plugins to install
    - Setup dotfiles for zsh
        - aliases for pacman and yay to ask to add package to dotfiles
* Setup tmux
    - TODO: setup_tmux.sh
* Setup zathura
    - Packages to install
        - zathura
        - zathura-cb
        - zathura-djvu
        - zathura-pdf-mupdf
    - TODO: setup_zathura.sh
        - ~/.config/zathura/zathurarc
    - Checkout integrating suckless tabbed with zathura
    - Modify zathurarc
        - Enable copy to clipboard `set selection-clipboard clipboard`
        - [Arch Wiki](https://wiki.archlinux.org/index.php/Zathura)
* TODO: Setup LaTex
* TODO: Setup directory structure
    - ~/Downloads
    - ~/projects
        - Clone relevant git repos
    - ~/temp
    - ~/notes


### End Goal for update.sh:
* Update packages
    - Update pacman
    - Update yay
* Update vim plugins
* Update zsh plugins?
