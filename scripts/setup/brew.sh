#! /bin/bash

brew_taps=(
    caskroom/fonts
    railwaycat/emacsmacport
#   d12frosted/emacs-plus
)



cli_apps=(
    awscli
    curl
    diff-so-fancy
    direnv
    editorconfig
#   emacs-plus --HEAD --with-natural-title-bars
    emacs-mac --with-gnutls --with-imagemagick --with-spacemacs-icon
    brew install gnupg
    exa
    fish
    fzf
    ghq
    gibo
    git
    httpie
    hub
    jq
    m-cli
    mas
    mysql --client-only
    neovim
    newt
    openssl
    sshrc
    the_silver_searcher
    tmux
    reattach-to-user-namespace
    tree
    wget
    wrk

    # android-sdk
    # aspell
    # autoconf
    # autojump
    # automake
    # byobu
    # erlang
    # ghc
    # highway
    # imagemagick
    # libtool
    # libxslt
    # libyaml
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
    clipy
    docker
    flux
    google-chrome
    google-japanese-ime
    # gpg-suite
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
    font-fira-code
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

echo "${brew_taps[*]}" | xargs brew tap
echo "${cli_apps[*]}" | xargs brew install
echo "${cask_apps[*]}" | xargs brew cask install
echo "${mas_apps[*]}" | xargs mas install
echo "${fonts[*]}" | xargs brew cask install

brew upgrade
brew cleanup
