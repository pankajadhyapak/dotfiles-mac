# macOS dotfiles

 ### Using
- [AeroSpace (for window management)](https://github.com/nikitabobko/AeroSpace)
- [SketchyBar (top bar)](https://github.com/FelixKratz/SketchyBar)
- [catppuccin theme](https://github.com/catppuccin/catppuccin)

1. ```xcode-select --install```

2. ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"```

3. ```git clone git@github.com:pankajadhyapak/dotfiles-mac.git .dotfiles```

4. ```./install.sh```

5. ```sudo softwareupdate --install-rosetta --agree-to-license```

# Dev deps
```./dev.sh```

# Commands
```brew bundle dump --describe -f```
## Preview

# Docker

```
# Delete any configuration from previous installs
rm -rf ~/.docker/config.json

# Set symlink
sudo ln ~/.config/colima/default/docker.sock /var/run

# Start Colima
colima start

# Check status
colima status
```


![Preview](preview.png)
