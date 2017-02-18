if ! test $SHELL = '/usr/local/bin/fish'; then
    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
Change SHELL to Fish
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    if ! cat /etc/shells | grep '/usr/local/bin/fish'; then
        sudo sed -i '' '
        $a\
            /usr/local/bin/fish
        ' /etc/shells
    fi

    chsh -s /usr/local/bin/fish

    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
Install FISHERMAN
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi
