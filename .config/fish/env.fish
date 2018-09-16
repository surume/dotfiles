# Env path ================================================
set -x TERM "xterm-256color"

set -x EDITOR 'vim'
set -x GOPATH $HOME/src
set -x DIFF_HIGHLIGHT_PATH /usr/local/share/git-core/contrib/diff-highlight
# set -x ANDROID_HOME=/usr/local/opt/android-sdk

set -x PATH /usr/local/bin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $DIFF_HIGHLIGHT_PATH $PATH

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)


# direnv
direnv hook fish | source
