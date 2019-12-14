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

if [ ! -e ~/.spacemacs ]; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Install spacemacs
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    rm -rf ~/.emacs.d; git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d;
fi

copy_file () {
    if [ ! -e ~/$1 ]; then
        echo "copy $1"
        cp -rf `pwd`/$1 ~
    fi
}
export -f copy_file

link_file () {
    if [ ! -e ~/$1 ]; then
        echo "link $1"
        ln -s `pwd`/$1 ~
    fi
}
export -f link_file


cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Link file
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
ls -A | grep -v _local | grep -vwe default-gems -vwe README -e install -e private -e "line_hidden.sh" -e ".git" -e ".gitmodules" | xargs -I{} bash -c "link_file {}"


cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Copy files
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
ls -A | grep _local | xargs -I{} bash -c "copy_file {}"

if [ ! -e ~/.local/share/zsh/.zshrc ]; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Create .local/zsh/.zshrc and .local/fish/config.fish
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    mkdir -p ~/.local/share/zsh
    echo "export DOTFILES_PATH=$DOTFILES_PATH" >> ~/.local/share/zsh/.zshrc
    mkdir -p ~/.local/share/fish
    echo "set -x DOTFILES_PATH $DOTFILES_PATH" >> ~/.local/share/fish/config.fish
fi

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