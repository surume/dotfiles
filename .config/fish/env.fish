# Env path ================================================
set -x EDITOR 'vim'

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/share/git-core/contrib/diff-highlight
fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path /opt/homebrew/opt/openjdk@11/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.krew/bin

set -x MY_GITHUB_ROOT (ghq root)/github.com/(git config --get user.name)
set -x MAS_NO_AUTO_INDEX 1
set -x USE_GKE_GCLOUD_AUTH_PLUGIN True
set -x LOCAL_IP_ADDRESS (ifconfig | grep inet | cut -d " " -f2 | grep "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | awk 'NR==2')

mise activate fish | source
mise complete -s fish | source
direnv hook fish | source
