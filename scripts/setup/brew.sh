if ! which brew > /dev/null 2>&1 ; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install [brew] command
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install APPS
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF

# brew tap =================================================
brew tap \
     caskroom/cask \
     caskroom/fonts \
     railwaycat/emacsmacport \
     tkengo/highway


# brew install =============================================
brew install \
     autojump \
     automake \
     awscli \
     fish \
     fzf \
     newt \
     byobu \
     curl \
     diff-so-fancy \
     direnv \
     emacs-mac --with-gnutls --with-imagemagick --with-spacemacs-icon \
     erlang \
     ghc \
     ghq \
     gibo \
     git \
     hub \
     highway \
     jq \
     m-cli \
     markdown \
     mas \
     mysql --client-only \
     reattach-to-user-namespace \
     sbt \
     sshrc \
     the_silver_searcher \
     tig \
     tmux \
     tree \
     vim \
     wget \
     wrk \
     z
# brew install android-sdk
# brew install imagemagick
# brew install packer


# brew cask install =============================================
brew cask install \
     alcatraz \
     alfred \
     appcleaner \
     bettertouchtool \
     caffeine \
     clipy \
     docker \
     flux \
     google-chrome \
     google-japanese-ime \
     gpgtools \
     java \
     kitematic \
     slack \
     the-unarchiver \
     virtualbox

# brew cask install android-studio
# brew cask install atom
# brew cask install bartender
# brew cask install dash
# brew cask install dropbox
# brew cask install evernote
# brew cask install firefoxdeveloperedition-ja
# brew cask install forklift
# brew cask install genymotion
# brew cask install hyperswitch
# brew cask install intel-haxm
# brew cask install intellij-idea
# brew cask install insomniax
# brew cask install iterm2
# brew cask install kaleidoscope
# brew cask install karabiner
# brew cask install karabiner-elements
# brew cask install kindle
# brew cask install licecap
# brew cask install seashore
# brew cask install sketch
# brew cask install skitch
# brew cask install trailer
# brew cask install vagrant
# brew cask install vagrant-bar
# brew cask install vagrant-manager
# brew cask install xquartz
# brew cask install xtrafinder

# font install ==========================================
brew cask install font-fira-code
# brew cask install font-ricty-diminished
