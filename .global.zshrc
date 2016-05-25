#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
if [ -e Liunx.txt ]; then
   source ~/.tmuxinator/tmuxinator.zsh
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# 履歴を保存するファイル
HISTFILE=$HOME/.zhistory

# メモリ内の履歴の数
HISTSIZE=1000000

# $HISTFILE に保存される履歴の数
SAVEHIST=1000000

# z
# . `brew --prefix`/etc/profile.d/z.sh
# function precmd () {
#   z --add "$(pwd -P)"
# }

# peco設定
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# Customize to your needs...
setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
setopt HIST_NO_STORE              # histroyコマンドは記録しない
export ANYENV_ROOT=~/.anyenv
export GOPATH=~/
export TERM="xterm-256color"
export EDITOR='vim'
export DOCKER_HOST="tcp://192.168.59.103:2376"
export DOCKER_CERT_PATH="/Users/s_miyamoto/.boot2docker/certs/boot2docker-vm"
export DOCKER_TLS_VERIFY=1
export VAGRANT_HOME=$HOME
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:~/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/bin
export PATH=${ANYENV_ROOT}/bin:$PATH
export PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# anyenv
if which anyenv > /dev/null; then eval "$(anyenv init - zsh)"; fi
# direnv
whence direnv >/dev/null && eval "$(direnv hook zsh)"


# git branch選択をpecoで
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
# git remotebranch 選択をpecoで
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
#grep color
alias grep='grep --color=auto'
# ghqディレクトリ
alias cdghq='cd $(ghq list -p | peco)'
# ghqディレクトリ削除
alias rmghq='rm -rf $(ghq list -p | peco)'
# emacs
# alias emacs='open -a ~/Applications/Emacs.app'
# bundle exec
alias be='bundle exec'
# vim
alias vi='vim'
# git
alias g='git'
# vagrant
alias v='vagrant'
alias fuck='$(thefuck $(fc -ln -1))'
# docker
alias d='docker'
alias fig='docker-compose'
alias b2docker='docker-machine'
# ssh
alias ssh='rm -f ~/.ssh/config; cat ~/.sshlocal/config ~/.ssh/global.config > ~/.ssh/config; ssh'
function peco-ssh() {
  SSH=$(grep "^\s*Host " ~/.ssh/config | sed s/"[\s ]*Host "// | grep -v "*" |  tr  ' ' '\n' | sort | peco)
  ssh $SSH
}
alias ss="peco-ssh"

# chrome
alias chrome='open "/Applications/Google Chrome.app/" --args --renderer-process-limit=1'


function git(){hub "$@"}

# export DATABASE_URL=mysql2://root:supersecretpass@$(docker-machine ip dev):3306
source /usr/local/share/zsh/site-functions/_aws
