if [[ $TERM == st-256color ]];
then
    ADOTDIR=$HOME/.config/antigen
    ANTIGEN_LOG=$HOME/.config/antigen/antigen.log
    POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
    POWERLEVEL9K_DISABLE_RPROMPT=true
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status user dir vcs)
    source /usr/share/zsh/share/antigen.zsh
    
    antigen use oh-my-zsh
    
    antigen bundle colored-man-pages
    antigen bundle cp
    
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-autosuggestions
    
    antigen theme bhilburn/powerlevel9k powerlevel9k
    
    antigen apply
    
    bindkey '^ ' autosuggest-accept
else
    autoload -Uz promptinit
    promptinit
    
    PROMPT='%B%F{green}[%F{red}%(?..%? )%(!.%F{red}root@.%F{cyan}%n@)%F{green}%2~]%f%b '
fi
