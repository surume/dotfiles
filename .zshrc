# General =================================================
autoload -U compinit
compinit -u
setopt prompt_subst
setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
setopt HIST_NO_STORE              # histroyコマンドは記録しない
HISTFILE=$HOME/.zhistory # 履歴を保存するファイル
HISTSIZE=1000000 # メモリ内の履歴の数
SAVEHIST=1000000 # $HISTFILE に保存される履歴の数
# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Env path ================================================
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export TERM="xterm-256color"
export VAGRANT_HOME=$HOME
# 何故かEDITERを指定するとtmuxでctrl+F,Bとかが効かないのでとりあえずコメントアウトしている
# export EDITOR='vim'
# export ANDROID_HOME=/usr/local/opt/android-sdk
export JOHN_HOME=/usr/local/Cellar/john-jumbo/1.8.0/share/john
export ANYENV_ROOT=~/.anyenv
export GOPATH=~/src

export PATH=${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:${PATH}
export PATH=${ANYENV_ROOT}/bin:$PATH
export PATH=${JOHN_HOME}:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# anyenv
if which anyenv > /dev/null; then eval "$(anyenv init - zsh)"; fi
# direnv
whence direnv >/dev/null && eval "$(direnv hook zsh)"


# Plugin ==================================================
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "plugins/brew", from:oh-my-zsh, nice:10
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh, if:"(( $+commands[git] ))"

zplug "mollifier/anyframe"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# themes
zplug "shashankmehta/dotfiles", use:"/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme"
# zplug 'themes/sorin', from:oh-my-zsh, nice:11


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Alias ====================================================
alias cdghq=anyframe-widget-cd-ghq-repository
# ghqディレクトリ削除
alias rmghq='rm -rf $(ghq list -p | peco)'
alias killp=anyframe-widget-kill
# alias tmuxa=anyframe-widget-tmux-attach
alias ll='ls -al'
# git branch選択をpecoで
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
# git remotebranch 選択をpecoで
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
#grep color
alias grep='grep --color=auto'
# bundle exec
alias be='bundle exec'
# vim
alias vi='vim'
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
# global ip
alias globalip='curl globalip.me'
function git(){hub "$@"}

# Bind Key ====================================================

bindkey '^r' anyframe-widget-execute-history

# local.zshrc =================================================
if [ -e ~/.local.zshrc ]; then
    source ~/.local.zshrc
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
