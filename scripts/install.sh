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

if [ ! -d $DOTFILES_PATH ]; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Start git clone dotfiles repo
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    git clone git@github.com:Surume/dotfiles.git $DOTFILES_PATH
fi


source $DOTFILES_PATH/scripts/setup/brew.sh
source $DOTFILES_PATH/scripts/setup/deploy_dotfiles.sh
source $DOTFILES_PATH/scripts/setup/asdf.sh
source $DOTFILES_PATH/scripts/setup/fish.sh
source $DOTFILES_PATH/scripts/setup/mac_settings.sh
fish $DOTFILES_PATH/scripts/setup/install.fish



cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Provision Finished
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#

      ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    ->             !!! Please Restart Terminal !!!             <-
      ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

EOF

