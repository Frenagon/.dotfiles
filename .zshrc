# Add user scripts to PATH
PATH="$HOME/.local/bin:$PATH"

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

# dotfiles aliases
alias dog="/usr/bin/git --git-dir='$HOME/.dotfiles/' --work-tree='$HOME'"
alias dos="dog status"
alias dolg="dog log"
alias dolo="dog log --oneline"
alias dolog="dog log --oneline --graph --all"
alias dols="dog log --stat"
alias dod="dog diff"
alias dods="dog diff --staged"
alias doc="dog checkout"
alias dob="dog branch"
alias dosw="dog switch"
alias doswm="dog switch master"
alias doswh="dog switch hyprland"
alias doswmo="dog switch macOS"
function doaa {
  dog add "$@"
  dog status
  dog diff --staged
}
alias doa="doaa -u"
alias docm="dog commit -m"
alias dop="dog push"
alias dopf="dog push --force"
alias doll="dog pull"
alias dor="dog reset"
alias dora="dog reset HEAD ."
alias dorh="dog reset --hard"
alias dorb="dog rebase"
alias dorbm="dog rebase master"
alias dorbc="dog rebase --continue"
alias domt="dog mergetool"

# Configuration aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias nvimconfig="nvim ~/.config/nvim"
alias binedit="nvim ~/.local/bin"
