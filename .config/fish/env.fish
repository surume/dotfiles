# Env path ================================================
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"
set -x TERM "xterm-256color"
set -x VAGRANT_HOME $HOME
# set -x BYOBU_PREFIX $(brew --prefix)
# 何故かEDITERを指定するとtmuxでctrl+F,Bとかが効かないのでとりあえずコメントアウトしている
# set -x EDITOR='vim'
# set -x ANDROID_HOME=/usr/local/opt/android-sdk
# set -x JOHN_HOME=/usr/local/Cellar/john-jumbo/1.8.0/share/john
set -x ANYENV_ROOT ~/.anyenv
set -x GOPATH ~/src
# set -x GIT_DIFF_HIGHLIGHT /usr/local/share/git-core/contrib/diff-highlight
# set -x JAVA_HOME $(/usr/libexec/java_home -v 1.8)

# set -x PATH ~/.bin $PATH
# set -x PATH ~/.local/bin $PATH
# set -x PATH /usr/local/bin $PATH
# set -x PATH $GOPATH/bin $PATH

set -x PATH $ANYENV_ROOT/bin $PATH
# set -x PATH=${JOHN_HOME} $PATH
set -x PATH $GIT_DIFF_HIGHLIGHT $PATH
# set -x PATH $HOME/.nodebrew/current/bin $PATH

# anyenv
# if status –is-interactive
#   eval (command anyenv init - | psub)
# end
# if which anyenv > /dev/null; then eval "$(anyenv init - --no-rehash)"; fi
# eval (command anyenv init - fish)
# eval (command anyenv init - --no-rehash)
# status --is-interactive; and source (anyenv init -|psub)
# eval (anyenv init - fish)
# direnv
# whence direnv >/dev/null and eval "$(direnv hook fish)"

# set -x YARN_GLBL_PATH $(yarn global bin)
# set -x PATH $YARN_GLBL_PATH $PATH

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)

