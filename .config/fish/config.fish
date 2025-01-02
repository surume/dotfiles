set -g theme_color_scheme zenburn

if status --is-login
  . ~/.config/fish/env.fish
  . ~/.config/fish/aliases.fish
end

set -g PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
starship init fish | source

# pnpm
set -gx PNPM_HOME "/Users/shotamiyamoto/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Created by `pipx` on 2024-09-26 12:14:40
set PATH $PATH /Users/shotamiyamoto/.local/bin
