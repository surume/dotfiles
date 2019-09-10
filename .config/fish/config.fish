set -g theme_color_scheme zenburn

if status --is-login
  . ~/.config/fish/env.fish
  . ~/.config/fish/aliases.fish
end

. ~/.local/share/fish/config.fish
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
