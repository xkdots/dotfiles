#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setxkbmap -layout fr -option caps:escape -option ctrl:swap_lalt_lctl_lwin -option altwin:menu_win

alias ls='ls --color=auto'
alias paru='paru --bottomup'
alias q='exit'

source ~/.alias

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"


