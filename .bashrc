#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setxkbmap -layout fr -option caps:escape -option ctrl:swap_lalt_lctl_lwin -option altwin:menu_win

alias ls='ls --color=auto'
alias paru='paru --bottomup'
alias q='exit'

source ~/.alias

# functions
m() { mkdir -p "$@" && cd "$@"; }

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# DEV specifics
export PATH=~/.local/bin:"$PATH"


# sumup
alias solomini='while [ ! -w /dev/ttyACM0 ] ; do echo sleeping ; sleep 0.5; done ; echo "- - - - - - connected! - - - - - -" ;minicom -D /dev/ttyACM0 -b 115200'
alias solominiu='while [ ! -w /dev/ttyUSB0 ] ; do echo sleeping ; sleep 0.5; done ; echo "- - - - - - connected! - - - - - -" ;minicom -D /dev/ttyUSB0 -b 115200'



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

