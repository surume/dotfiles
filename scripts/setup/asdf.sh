cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
Install asdf with Program Langs
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF

# Install asdf
# See: https://github.com/asdf-vm/asdf
if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
fi

langInstall () {
    if ! asdf plugin-list | grep $1 > /dev/null 2>&1 ; then
        asdf plugin-add $1 https://github.com/$2.git
    fi
    asdf install $1 $3
    asdf global $1 $3
}


# LANG INSTALL
langInstall elixir asdf-vm/asdf-elixir 1.4.2
langInstall go kennyp/asdf-golang 1.8
langInstall nodejs asdf-vm/asdf-nodejs 7.7.1
langInstall ruby asdf-vm/asdf-ruby 2.4.0
langInstall rust code-lever/asdf-rust 1.15.1
langInstall scala mtatheonly/asdf-scala 2.12.1
