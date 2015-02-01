#
# Setup
#

# Xcode license認証
sudo xcodebuild -license

xcode-select --install

# Brewのインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

# brewFileInstall
pushd brew
sh ./installBrewFiles.sh
sh ./brewCaskInstall.sh
popd

# getSetting
pushd git
sh ./deployGitSetting.sh
popd 

# vimSetting
pushd vim
sh ./installNeobundle.sh
sh ./deployVimSetting.sh
popd


# zsh設定
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

# rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshenv

# go lang install
echo "export GOPATH=$HOME" >> ~/.zshenv
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.zshrc

# font wo ricty ni
cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# preztoインストール
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

source ~/.zshenv
