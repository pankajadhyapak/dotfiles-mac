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
# Skipped here only; they stay in the Brewfile:
# - Numbers, Pages, Spark, Xcode (HOMEBREW_BUNDLE_MAS_SKIP)
# - cloudsql-read: a local npm link, not on the registry (bundle has no npm skip list)
grep -v '^npm "cloudsql-read"$' Brewfile |
  HOMEBREW_BUNDLE_MAS_SKIP="409203825 409201541 1176895641 497799835" brew bundle --file=-

#gitconfig
# copied, not linked: tools (gh, git config --global) write machine-specific settings into it
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"
[ -f "$HOME/.gitconfig" ] || cp "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

#ghostty
rm -rf "$XDG_CONFIG_HOME/ghostty"
ln -s "$DOTFILES/ghostty" "$XDG_CONFIG_HOME"

#Vscode
rm -rf "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "$DOTFILES/vscode.json" "$HOME/Library/Application Support/Code/User/settings.json"

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

#tagwm
mkdir -p "$XDG_CONFIG_HOME/tagwm"
ln -sf "$DOTFILES/tagwm/tagwm.toml" "$XDG_CONFIG_HOME/tagwm/tagwm.toml"

#tinycast
mkdir -p "$XDG_CONFIG_HOME/tinycast"
ln -sf "$DOTFILES/tinycast/settings.json" "$XDG_CONFIG_HOME/tinycast/settings.json"

#rgitlight (repositories.json and state.json stay local)
mkdir -p "$XDG_CONFIG_HOME/rgitlight"
ln -sf "$DOTFILES/rgitlight/settings.json" "$XDG_CONFIG_HOME/rgitlight/settings.json"
rm -rf "$XDG_CONFIG_HOME/rgitlight/themes"
ln -s "$DOTFILES/rgitlight/themes" "$XDG_CONFIG_HOME/rgitlight/themes"

#Aersospace
rm -rf "$XDG_CONFIG_HOME/aerospace"
ln -s "$DOTFILES/aerospace" "$XDG_CONFIG_HOME"

#tmux
rm -rf "$XDG_CONFIG_HOME/tmux"
ln -s "$DOTFILES/tmux" "$XDG_CONFIG_HOME"

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
