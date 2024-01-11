# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Maven
export PATH=/opt/apache-maven-3.8.7/bin:$PATH

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
