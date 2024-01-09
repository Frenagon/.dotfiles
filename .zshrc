# Path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the name of the theme.
ZSH_THEME="spaceship"

# Folder for the custom configuration.
ZSH_CUSTOM=$HOME/.config/zsh

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST="${HOST/.*/}"
else
  SHORT_HOST="${HOST/.*/}"
fi

# Create a cache folder if it doesn't exists
if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi

# History file configuration
export HISTFILE="$HOME/.cache/zsh/.zsh_history"

# Compdump file configuration
export ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Select the plugins to load
plugins=(
	git
	history
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Configuration aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias config="/usr/bin/git --git-dir='$HOME/.dotfiles/' --work-tree='$HOME'"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
