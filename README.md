# dotfiles

[![Check](https://github.com/surume/dotfiles/actions/workflows/check.yaml/badge.svg)](https://github.com/surume/dotfiles/actions/workflows/check.yaml)

## Install

```bash
git clone git@github.com:surume/dotfiles.git ~/src/github.com/surume/dotfiles
cd ~/src/github.com/surume/dotfiles
./setup
```

## Usage

```bash
./setup           # Run all setup steps
./setup apps      # Install apps (Brewfile)
./setup link      # Create symlinks
./setup git       # Setup git user config
./setup fish      # Setup Fish shell + Fisher
./setup mac       # Apply macOS settings
./setup help      # Show usage
```

## Structure

```
.config/
├── claude/       # Claude Code settings, rules
├── Code/User/    # VSCode settings
├── fish/         # Fish shell config
├── ghostty/      # Ghostty terminal
├── git/          # Git config, aliases, ignore
├── karabiner/    # Keyboard remapping (Dvorak)
├── mise/         # Runtime version manager
├── starship.toml # Prompt theme
└── tmux/         # tmux config + catppuccin
Brewfile          # Homebrew packages
setup             # Setup script
```
