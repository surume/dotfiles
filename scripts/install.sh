cat << 'EOF'
  __              __         ___          ___
 /\ \            /\ \__    /'___\  __    /\_ \
 \_\ \     ___   \ \ ,_\  /\ \__/ /\_\   \//\ \       __     ____
 /'_` \   / __`\  \ \ \/  \ \ ,__\\/\ \    \ \ \    /'__`\  /',__\
/\ \L\ \ /\ \L\ \  \ \ \_  \ \ \_/ \ \ \    \_\ \_ /\  __/ /\__, `\
\ \___,_\\ \____/   \ \__\  \ \_\   \ \_\   /\____\\ \____\\/\____/
 \/__,_ / \/___/     \/__/   \/_/    \/_/   \/____/ \/____/ \/___/
EOF

if test "${DOTFILES_PATH}" = "";then
 cat << 'EOF'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  DOTFILES_PATH is undefined 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF
exit
fi

if ! which brew > /dev/null 2>&1 ; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install [brew] command
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

if ! which m > /dev/null 2>&1 ; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install [m-cli] command
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh
fi

dotfiles_path=$DOTFILES_PATH
if [ ! -d $dotfiles_path ]; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Start git clone dotfiles repo
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    git clone git@github.com:Surume/dotfiles.git $dotfiles_path
fi

cd "$dotfiles_path/provision"

if ! which bundle > /dev/null 2>&1 ; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install [bundler] command
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    printf "password: "
    read password
    echo "$password" | sudo -S gem install bundler
    cd provision
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Start itamae provision
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
bundle install --path=vendor/bundle
export ANYENV_ROOT="${HOME}/.anyenv"
export CONFIGURE_OPTS="--disable-install-rdoc"
bundle exec itamae local -y node.yml roles/local.rb

if [ -f $dotfiles_path/scripts/deploy_dotfiles.sh ]; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install dotfiles
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    cd $dotfiles_path/scripts
    sh $dotfiles_path/scripts/deploy_dotfiles.sh
fi

if [ ! -e ~/Library/Application\ Support/Alcatraz ]; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install Alcatraz
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install mergepbx
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
curl -s https://gist.githubusercontent.com/kaneshin/40d9331941682bf46f5d/raw/42e2a7df2d8dbf6c956edcd3fd1c332e3364f573/install_mergepbx.sh | sh

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Change mac settings
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
cd $dotfiles_path/scripts
sh $dotfiles_path/scripts/mac_settings.sh


if ! test $SHELL = '/usr/local/bin/zsh'; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
Change SHELL to Zsh
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    if ! cat /etc/shells | grep '/usr/local/bin/zsh'; then
        sudo sed -i '' '
        $a\
        /usr/local/bin/zsh
        ' /etc/shells
    fi

    chsh -s /usr/local/bin/zsh
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Provision Finished
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#

   ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
 ->             Please Restart Terminal !!!!!               <-
   ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

EOF

