# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sebi/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sebi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sebi/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/sebi/.fzf/shell/key-bindings.zsh"
