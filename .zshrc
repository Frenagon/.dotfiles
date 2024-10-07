# Add user scripts to PATH
PATH="$HOME/.local/bin:$PATH"

# Path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Folder for the custom configuration.
export ZSH_CUSTOM=$HOME/.config/zsh

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
	# macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
	SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST="${HOST/.*/}"
else
	SHORT_HOST="${HOST/.*/}"
fi

# Create a cache folder if it doesn't exists
if [ ! -d "$HOME/.cache/zsh" ]; then
	mkdir -p "$HOME/.cache/zsh"
fi

# History file configuration
export HISTFILE="$HOME/.cache/zsh/.zsh_history"

# Compdump file configuration
export ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Select the plugins to load
export plugins=(
	git
	history
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# shellcheck source=/dev/null
source "$ZSH/oh-my-zsh.sh"

# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# User configuration

# pnpm
export PNPM_HOME="/home/frenagon/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pkg-config path configuration
export PKG_CONFIG_PATH="/opt/homebrew/opt/jpeg/lib/pkgconfig"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='code'
fi

# Error handling
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

# Navigation
##################################################
# If argument is a directory; 'cd' to it
# If argument is a file; 'cd' to parent directory
# Arguments:
#   directory or file to 'cd' into
# Returns:
#   0 if 'cd' was succesful, 1 on error
##################################################
cdf() {
  if [[ -f "$1" ]]; then
    cd "$(dirname "$1")" || return 1
  elif [[ -d "$1" ]]; then
    cd "$1" || return 1
  else
    err "Invalid: argument not a file or directory"
    return 1
  fi
}

##################################################
# Opens $EDITOR with the working directory set on
# the target directory or file parent directory
# Arguments:
#   directory or file to edit
##################################################
edit_cwd() {
  local current_dir="$PWD"
  if [[ -f "$1" ]]; then
    cd "$(dirname "$1")" || return 1
    $EDITOR "$(basename "$1")"
  elif [[ -d "$1" ]]; then
    cd "$1" || return 1
    $EDITOR .
  fi
  cd "$current_dir" || return 1
}

# dotfiles aliases
alias dog='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dos="dog status"
alias dolg="dog log"
alias dolo="dog log --oneline"
alias dolog="dog log --oneline --graph master origin/master macOS origin/macOS"
alias dologa="dog log --oneline --graph --all"
alias dols="dog log --stat"
alias dod="dog diff"
alias dods="dog diff --staged"
alias doc="dog checkout"
alias dob="dog branch"
alias dosw="dog switch"
alias doswm="dog switch master"
alias doswh="dog switch hyprland"
alias doswmo="dog switch macOS"
alias doswwsl="dog switch WSL"
doaa() {
	if dog add "$@"; then
		dog status
		dog diff --staged
	fi
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
alias zshconfig="edit_cwd ~/.zshrc"
alias ohmyzsh="edit_cwd ~/.oh-my-zsh"
alias zshcustom="edit_cwd ~/.config/zsh"
alias kittyconfig="edit_cwd ~/.config/kitty/kitty.conf"
alias nvimconfig="edit_cwd ~/.config/nvim"
alias binedit="edit_cwd ~/.local/bin"
alias gitconfig="edit_cwd ~/.gitconfig"

# Rename aliases
alias c="code"
alias codeh="code ."
alias ch="code ."

# Common uses
cgrep() {
  if [ -z "$1" ]; then
    echo "Provide a source to read"
  elif [ -z "$2" ]; then
    echo "Provide a string to search"
  else
    cat "$1" | grep "$2"
  fi
}

# Starship pompt
eval "$(starship init zsh)"