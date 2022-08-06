# Env path ================================================
set -x TERM "xterm-256color"

set -x EDITOR 'vim'
set -x GOPATH $HOME
set -x DIFF_HIGHLIGHT_PATH /usr/local/share/git-core/contrib/diff-highlight
# set -x ANDROID_HOME=/usr/local/opt/android-sdk

set -x PATH /usr/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/sbin $PATH
set -x PATH /opt/homebrew/share/git-core/contrib/diff-highlight/ $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $DIFF_HIGHLIGHT_PATH $PATH
set -x PATH /usr/local/opt/mysql-client/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/bin $PATH
set -x PATH /bin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /sbin $PATH
set -x PATH $PATH $HOME/.krew/bin

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)
set -x DOCKER_BUILDKIT 1
set -x COMPOSE_DOCKER_CLI_BUILD 1

# direnv
direnv hook fish | source
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
