#!/bin/zsh

echo "Setting up your Mac..."

source "zsh/.zshenv"

# Create a basic directory
mkdir -p $HOME/code
mkdir -p $HOME/work
mkdir -p $HOME/screenshots
mkdir -p $HOME/.config

sudo -v

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

#gitconfig
rm -rf "$HOME/.gitignore"
rm -rf "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"
cp "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
git config --global core.excludesFile  "$HOME/.gitignore"

#Vscode
rm -rf "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$DOTFILES/vscode.json" "$HOME/Library/Application Support/Code/User/settings.json"

#wezterm
rm -rf "$XDG_CONFIG_HOME/wezterm"
ln -s "$DOTFILES/wezterm" "$XDG_CONFIG_HOME"

#alacritty
rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME"

# Zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/zshrc" "$XDG_CONFIG_HOME/zsh/zshrc"
ln -sf "$DOTFILES/zsh/zsh-aliases" "$XDG_CONFIG_HOME/zsh/zsh-aliases"
ln -sf "$DOTFILES/zsh/zsh-functions" "$XDG_CONFIG_HOME/zsh/zsh-functions"
ln -sf "$DOTFILES/zsh/zsh-prompt" "$XDG_CONFIG_HOME/zsh/zsh-prompt"
printf '#!/bin/zsh

source "$ZDOTDIR/zshrc"' > "$XDG_CONFIG_HOME/zsh/.zshrc"

#skhd
rm -rf "$XDG_CONFIG_HOME/skhd"
ln -s "$DOTFILES/skhd" "$XDG_CONFIG_HOME"

#yabai
rm -rf "$XDG_CONFIG_HOME/yabai"
ln -s "$DOTFILES/yabai" "$XDG_CONFIG_HOME"

#karabiner
rm -rf "$XDG_CONFIG_HOME/karabiner"
ln -s "$DOTFILES/karabiner" "$XDG_CONFIG_HOME"

#tmux
rm -rf "$XDG_CONFIG_HOME/tmux"
ln -s "$DOTFILES/tmux" "$XDG_CONFIG_HOME"

#sketchybar
rm -rf "$XDG_CONFIG_HOME/sketchybar"
ln -s "$DOTFILES/sketchybar" "$XDG_CONFIG_HOME"
chmod -R +x "$DOTFILES/sketchybar"

touch ${HOME}/.hushlogin

# Set macOS preferences
# source .macos
