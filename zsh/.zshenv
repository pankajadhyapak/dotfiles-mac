# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
# ZSH ROOT DIR
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export DOTFILES="$HOME/.dotfiles"

export EDITOR="nvim"
export VISUAL="nvim"

#homebrew
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
