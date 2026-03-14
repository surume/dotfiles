# dotfiles

[![Check](https://github.com/surume/dotfiles/actions/workflows/check.yaml/badge.svg)](https://github.com/surume/dotfiles/actions/workflows/check.yaml)

## Install

```bash
curl -sL https://raw.githubusercontent.com/surume/dotfiles/master/install | bash
```

To change install directory:

```bash
DOTFILES_PATH=~/your/path curl -sL https://raw.githubusercontent.com/surume/dotfiles/master/install | bash
```

Or manually:

```bash
git clone git@github.com:surume/dotfiles.git <your-path>
cd <your-path>
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
├── Code/User/    # VSCode settings, keybindings, extensions
├── fish/         # Fish shell config
├── ghostty/      # Ghostty terminal
├── git/          # Git config, aliases, ignore, attributes
├── karabiner/    # Keyboard remapping (Dvorak)
├── mise/         # Runtime version manager
├── pgcli/        # PostgreSQL CLI config
├── starship.toml # Prompt theme
└── tmux/         # tmux config + catppuccin
bin/
└── claude-status-hook  # Claude Code status for SwiftBar
google_ime/       # Google IME keymap
swiftbar/
└── plugins/      # SwiftBar menu bar plugins
.github/          # CI workflows, PR template
.sshrc            # SSH aliases
.vimrc            # Vim config
.pr_agent.toml    # PR Agent config (CI)
Brewfile          # Homebrew packages
install           # One-liner bootstrap (curl | bash)
setup             # Setup script
```
