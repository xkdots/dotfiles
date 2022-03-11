if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim 

export TERM=xterm-256color

alias q="exit"
alias paru="paru --bottomup"
alias ghg='ghq get'
alias ghl='cd (ghq list -p | fzf)'

set fish_greeting "🐟"

starship init fish | source

source ~/.alias

# key remaps works in kitty
bind \ch backward-kill-word
bind '[3;5~' kill-word

function loc
    if count $argv > /dev/null
        locate $argv | fzf --preview 'bat --style numbers,changes --color=always {} | head -500' | xclip
    else
        locate / | fzf --preview 'bat --style numbers,changes --color=always {} | head -500'  | xclip
    end
end

function m
    mkdir -p -- $argv && cd -- $argv
end

function solomini
    sudo minicom -D /dev/ttyACM0
end

thefuck --alias | source
