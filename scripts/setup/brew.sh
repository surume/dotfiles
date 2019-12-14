#! /bin/bash

brew_taps=(
    weaveworks/tap
)

cli_apps=(
    awscli
    bat
    curl
    diff-so-fancy
    direnv
    editorconfig
    eksctl
    exa
    fd
    fish
    fzf
    ghq
    gibo
    git
    grpcurl
    httpie
    hub
    jq
    kubectx
    kubernetes-helm
    kustomize
    lazygit
    m-cli
    mas
    mysql-client
    neovim
    newt
    openssl
    pinentry-mac
    reattach-to-user-namespace
    ripgrep
    spectacle
    sshrc
    the_silver_searcher
    tig
    tmux
    tokei
    tree
    wget
    wrk
)

cask_apps=(
    alfred
    appcleaner
    caffeine
    clipy
    docker
    flux
    google-chrome
    google-japanese-ime
    # gpg-suite
    hyper
    kitematic
    slack
    the-unarchiver
    trailer
)

fonts=(
    font-fira-code
)

mas_apps=(
    443987910
    426410278
)

# Start Execute =========================================

if ! which brew > /dev/null 2>&1 ; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
Install [brew] command
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install APPS
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF

brew update
brew upgrade

echo "${brew_taps[*]}" | xargs -n1 -I {} /bin/bash -c "brew tap {}"
echo "${cli_apps[*]}" | xargs -n1 -I {} /bin/bash -c "brew install {}"
echo "${cask_apps[*]}" | xargs -n1 -I {} /bin/bash -c "brew cask install {}"
echo "${mas_apps[*]}" | xargs -n1 -I {} /bin/bash -c "mas install {}"
echo "${fonts[*]}" | xargs -n1 -I {} /bin/bash -c "brew cask install {}"
