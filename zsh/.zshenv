# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

#homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#PATHS
export PATH="$HOME/.local/bin:$HOME/.local/bin/scripts:$HOME/.local/bin/scripts/statusbar:$PATH"
export PATH="$XDG_CONFIG_HOME/composer/vendor/bin:$PATH"
export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events in history file
export SAVEHIST=100000

export DOTFILES="$HOME/.dotfiles"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
