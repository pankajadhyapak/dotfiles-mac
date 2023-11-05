# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
# ZSH ROOT DIR
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events in history file
export SAVEHIST=100000

export DOTFILES="$HOME/.dotfiles"

export EDITOR="nvim"
export VISUAL="nvim"

#homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"



