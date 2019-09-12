#! /bin/bash

brew_taps=(
    caskroom/fonts
    weaveworks/tap
    # railwaycat/emacsmacport
    # d12frosted/emacs-plus
)



cli_apps=(
    awscli
    bat
    curl
    diff-so-fancy
    direnv
    editorconfig
    eksctl
    "'emacs-mac --with-imagemagick --with-spacemacs-icon'"
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
    m-cli
    mas
    mysql-client
    neovim
    newt
    openssl
    pinentry-mac
    reattach-to-user-namespace
    sshrc
    the_silver_searcher
    tmux
    reattach-to-user-namespace
    ripgrep
    tree
    tokei
    wget
    wrk

    # android-sdk
    # aspell
    # autoconf
    # autojump
    # automake
    # byobu
    # emacs-plus --HEAD --with-natural-title-bars
    # erlang
    # ghc
    # gnupg
    # highway
    # imagemagick
    # libtool
    # libxslt   # libyaml
    # markdown
    # packer
    # readline
    # sbt
    # tig
    # unixodbc
    # z
)


cask_apps=(
    alfred
    appcleaner
    caffeine
    cheatsheet
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

    # alcatraz
    # android-studio
    # bettertouchtool
    # dash
    # dropbox
    # evernote
    # firefoxdeveloperedition-ja
    # forklift
    # genymotion
    # google-cloud-sdk
    # hyperswitch
    # insomniax
    # intel-haxm
    # intellij-idea
    # iterm2
    # java
    # karabiner
    # karabiner-elements
    # kindle
    # licecap
    # seashore
    # sketch
    # skitch
)


fonts=(
    caskroom/fonts/font-fira-code
)

mas_apps=(
    443987910
    426410278

    # 549083868
    # 539883307
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
