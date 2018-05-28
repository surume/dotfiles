# Env path ================================================
set -x TERM "xterm-256color"

set -x EDITOR 'vim'
set -x GOPATH $HOME/src
set -x CARGO_PATH $HOME/.cargo
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x VAGRANT_HOME $HOME
set -x DIFF_HIGHLIGHT_PATH /usr/local/share/git-core/contrib/diff-highlight
# set -x ANDROID_HOME=/usr/local/opt/android-sdk
# set -x JOHN_HOME=/usr/local/Cellar/john-jumbo/1.8.0/share/john

set -x PATH /usr/local/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $CARGO_PATH/bin $PATH
set -x PATH $DIFF_HIGHLIGHT_PATH $PATH
# set -x PATH $JOHN_HOME $PATH

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)
set -x YARN_GLBL_PATH (yarn global bin)
set -x PATH $YARN_GLBL_PATH $PATH


# direnv
direnv hook fish | source
