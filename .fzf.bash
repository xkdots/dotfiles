# Setup fzf
# ---------
if [[ ! "$PATH" == */home/x/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/x/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/x/.vim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/x/.vim/plugged/fzf/shell/key-bindings.bash"
