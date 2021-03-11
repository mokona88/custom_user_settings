# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/tn046199/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/tn046199/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/tn046199/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/tn046199/.fzf/shell/key-bindings.zsh"
