set -g theme_color_scheme zenburn
# 

# # General =================================================
# # autoload -U compinit
# # compinit -u
# # setopt prompt_subst
# # setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
# # setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
# # setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
# # setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
# # setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
# # setopt HIST_NO_STORE              # histroyコマンドは記録しない
# # HISTFILE=$HOME/.zhistory          # 履歴を保存するファイル
# # HISTSIZE=1000000                  # メモリ内の履歴の数
# # SAVEHIST=1000000                  # $HISTFILE に保存される履歴の数

# # # 大文字小文字を区別しない
# # zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# # # Alias ====================================================
# # # alias cdghq=anyframe-widget-cd-ghq-repository
# # # ghqディレクトリ削除
# # alias rmghq='rm -rf $(ghq list -p | peco)'
# # # alias killp=anyframe-widget-kill
# # # alias tmuxa=anyframe-widget-tmux-attach
# # alias ls='ls -G'
# # alias ll='ls -l'
# # alias la='ls -al'
# # # git branch選択をpecoで
# # alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
# # # git remotebranch選択をpecoで
# # alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
# # #grep color
# # alias grep='grep --color=auto'
# # # bundle exec
# # alias be='bundle exec'
# # # vim
# # alias vi='vim'
# # # vagrant
# # alias v='vagrant'
# # alias fuck='$(thefuck $(fc -ln -1))'
# # # docker
# # alias d='docker'
# # alias fig='docker-compose'
# # alias dst='docker stats $(docker ps|grep -v "NAMES"|awk '{ print $NF }'|tr "\n" " ")'
# # # ssh
# # alias ssh='rm -f ~/.ssh/config; cat ~/.sshlocal/config ~/.ssh/global.config > ~/.ssh/config; ssh'
# # # function peco-ssh() {
# # #   SSH=$(grep "^\s*Host " ~/.ssh/config | sed s/"[\s ]*Host "// | grep -v "*" |  tr  ' ' '\n' | sort | peco)
# # #   ssh $SSH
# # # }
# # # alias ss="peco-ssh"
# # # global ip
# # alias globalip='curl globalip.me'
# # # function git {hub "$@"}

# # Bind Key ====================================================
# # bindkey '^r' anyframe-widget-execute-history

# # local.zshrc =================================================
# # if [ -e ~/.local.zshrc ]; then
# #     source ~/.local.zshrc
# # fi

# # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# # iterm2 ======================================================
# # test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# # if type zprof > /dev/null 2>&1; then
# #   zprof | less
# # fi


# set -x ANYENV_ROOT ~/.anyenv
# set -gx EXENV_ROOT $ANYENV_ROOT/envs/exenv
# set -x PATH $PATH $EXENV_ROOT/bin
# # set -x EXENV_ROOT "/Users/surume/.anyenv/envs/exenv"
# set -x PATH $ANYENV_ROOT/bin $PATH
# status --is-interactive; and source (anyenv init -|psub)


# status --is-interactive; and . (rbenv init -|psub)
# # status --is-interactive; and source (anyenv init -|psub)

if status --is-login
  . ~/.config/fish/env.fish
  . ~/.config/fish/aliases.fish
end

. ~/.asdf/asdf.fish
. ~/.local/share/fish/config.fish
