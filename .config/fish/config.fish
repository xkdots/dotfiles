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
# ctrl backspace
bind \ch backward-kill-word
# ctrl del
bind '[3;5~' kill-word
# shift up
bind '[1;2A' up
# shift down
bind '[1;2B' down
# ctrl up
bind '[1;5A' any
# ctrl down
bind '[1;5B' go

function up
    cd ..
    echo ❯ (pwd)
    ls
end

function down
    set adir (fd -t d --maxdepth 1 | fzf)
    if test -n "$adir"
        cd $adir
    end
    echo ❯ (pwd)
    ls
end

function go
    set bdir (fd -t d | fzf)
    if test -n "$bdir"
        cd $bdir
    end
    echo ❯ (pwd)
    ls
end

function any
    set any (locate / | fzf --preview 'bat --style numbers,changes --color=always {} | head -500' )
    if test -n "$any"
        vim $any
    end
    # TODO key bind or universal to open
    # fzf --bind "enter:execute(less {})"
    # https://gist.github.com/mb720/86144b670599c0eab331cd2f48bd23b9
    # TODO make a keybind to open shell in current file directory
    # TODO ripgrep with preview
end

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
