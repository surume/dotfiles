set -g theme_color_scheme zenburn

if status --is-login
  . ~/.config/fish/env.fish
  . ~/.config/fish/aliases.fish
end

. ~/.asdf/asdf.fish
. ~/.local/share/fish/config.fish
