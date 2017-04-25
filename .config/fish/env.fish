# Env path ================================================
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"
set -x TERM "xterm-256color"
set -x VAGRANT_HOME $HOME
# set -x BYOBU_PREFIX $(brew --prefix)
set -x EDITOR 'vim'
# set -x ANDROID_HOME=/usr/local/opt/android-sdk
# set -x JOHN_HOME=/usr/local/Cellar/john-jumbo/1.8.0/share/john
set -x ANYENV_ROOT ~/.anyenv
set -x GOPATH ~/src
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

set -x PATH /usr/local/bin $PATH
set -x PATH ~/.cargo/bin $PATH
# set -x PATH $GOPATH/bin $PATH

set -x PATH $ANYENV_ROOT/bin $PATH
# set -x PATH=${JOHN_HOME} $PATH
# set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)
set -x YARN_GLBL_PATH (yarn global bin)
set -x PATH $YARN_GLBL_PATH $PATH


# direnv
direnv hook fish | source
