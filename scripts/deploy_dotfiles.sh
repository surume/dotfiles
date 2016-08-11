#!/bin/bash

EOF
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
    # rm -rf ~/.emacs.d/private; ln -s `pwd`/private ~/.emacs.d/private
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

# cd `pwd`/.zprezto/modules/prompt/functions/
# rm -f prompt_agnoster_setup prompt_powerline_setup prompt_pure_setup

if [ ! -e ~/.local.zshrc ]; then
cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Create .local.zshrc
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    echo "export DOTFILE_PATH=${dotfile_path}" >> ~/.local.zshrc
fi
