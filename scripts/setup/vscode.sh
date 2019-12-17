#!/bin/bash

if test "${DOTFILES_PATH}" = "";then
 cat << 'EOF'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  DOTFILES_PATH is undefined
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF
exit
fi

cd $DOTFILES_PATH

vscode_path=$HOME/Library/Application\ Support/Code\ -\ Insiders/User/
if [ ! -e "$vscode_path/keybindings.json" ]; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Copy VSCode setting
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    mkdir -p $vscode_path
    ls ./vscode | xargs -I {} ln -s $PWD/vscode/{} $HOME/Library/Application\ Support/Code\ -\ Insiders/User/{}
fi

cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install vscode extensions
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
cat ./vscode/extensions | while read line
do
  code-Insiders --install-extension $line
done
