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

function up
    cd ..
    pwd
end

function down
    cd (fd -t d | fzf)
    pwd
end

function go
    cd (fd -t d --maxdepth 1 | fzf)
    pwd
end

# key remaps works in kitty
bind \ch backward-kill-word
bind '[3;5~' kill-word
bind '[1;2A' up
bind '[1;2B' down
bind '[1;5A' any
bind '[1;5B' go

function loc
    if count $argv > /dev/null
        locate $argv | fzf --preview 'bat --style numbers,changes --color=always {} | head -500' | xclip
    else
        locate / | fzf --preview 'bat --style numbers,changes --color=always {} | head -500'  | xclip
    end
end

function any
    # TODO key bind or universal to open
    # fzf --bind "enter:execute(less {})"
    # https://gist.github.com/mb720/86144b670599c0eab331cd2f48bd23b9
    vim (locate / | fzf --preview 'bat --style numbers,changes --color=always {} | head -500' )
    # TODO make a keybind to open shell in current file directory
    # TODO ripgrep with preview
end

function m
    mkdir -p -- $argv && cd -- $argv
end

function solomini
    sudo minicom -D /dev/ttyACM0
end

thefuck --alias | source
