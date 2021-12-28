if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias q="exit"
alias paru="paru --bottomup"

set fish_greeting "🐟"

starship init fish | source

source ~/.alias


thefuck --alias | source
