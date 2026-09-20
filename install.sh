#!/bin/zsh

echo "Setting up your Mac..."

# Relative paths below (Brewfile, wallpaper.png, .macos) resolve from the repo root
cd "${0:A:h}"

source "zsh/.zshenv"

# Create a basic directory
mkdir -p $HOME/code
mkdir -p $HOME/work
mkdir -p $HOME/screenshots
mkdir -p $HOME/.config

sudo -v

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle

#gitconfig
# copied, not linked: tools (gh, git config --global) write machine-specific settings into it
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"
[ -f "$HOME/.gitconfig" ] || cp "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

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
ln -sf "$DOTFILES/zsh/zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
ln -sf "$DOTFILES/zsh/zsh-aliases" "$XDG_CONFIG_HOME/zsh/zsh-aliases"
ln -sf "$DOTFILES/zsh/zsh-functions" "$XDG_CONFIG_HOME/zsh/zsh-functions"
ln -sf "$DOTFILES/zsh/zsh-prompt" "$XDG_CONFIG_HOME/zsh/zsh-prompt"
# machine-specific settings and secrets live here, never in the repo
touch "$XDG_CONFIG_HOME/zsh/local.zsh" && chmod 600 "$XDG_CONFIG_HOME/zsh/local.zsh"

#Atuin
mkdir -p "$XDG_CONFIG_HOME/atuin"
ln -sf "$DOTFILES/atuin/config.toml" "$XDG_CONFIG_HOME/atuin/config.toml"

#Aersospace
rm -rf "$XDG_CONFIG_HOME/aerospace"
ln -s "$DOTFILES/aerospace" "$XDG_CONFIG_HOME"

#karabiner
rm -rf "$XDG_CONFIG_HOME/karabiner"
ln -s "$DOTFILES/karabiner" "$XDG_CONFIG_HOME"

#tmux
rm -rf "$XDG_CONFIG_HOME/tmux"
ln -s "$DOTFILES/tmux" "$XDG_CONFIG_HOME"
TPM="$XDG_CONFIG_HOME/tmux/plugins/tpm"
[ -d "$TPM" ] || git clone https://github.com/tmux-plugins/tpm "$TPM"
# install_plugins needs a server that has loaded the config
tmux new-session -d -s tpm-install \; source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"
"$TPM/bin/install_plugins"
tmux kill-session -t tpm-install

#sketchybar
rm -rf "$XDG_CONFIG_HOME/sketchybar"
ln -s "$DOTFILES/sketchybar" "$XDG_CONFIG_HOME"
chmod -R +x "$DOTFILES/sketchybar"

#colima
rm -rf "$XDG_CONFIG_HOME/colima/default/colima.yaml"
mkdir -p "$XDG_CONFIG_HOME/colima/default"
ln -s "$DOTFILES/colima/colima.yaml" "$XDG_CONFIG_HOME/colima/default/colima.yaml"

touch ${HOME}/.hushlogin

# Copy and set wallpaper
cp wallpaper.png ~/Pictures
wallpaper set ~/Pictures/wallpaper.png

# Set macOS preferences
source .macos
