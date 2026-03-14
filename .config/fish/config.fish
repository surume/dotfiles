if status --is-login
  . ~/.config/fish/env.fish
  . ~/.config/fish/aliases.fish
end

starship init fish | source
fish_add_path "$HOME/Library/pnpm"
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

