# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/thongnguyen/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/thongnguyen/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/thongnguyen/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/thongnguyen/.fzf/shell/key-bindings.zsh"
