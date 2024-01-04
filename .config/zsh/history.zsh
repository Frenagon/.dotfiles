# Create a cache folder if it doesn't exists
if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.cache/zsh/.zsh_history"
