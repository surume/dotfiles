    cat << 'EOF'
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
 Change mac settings
===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#===#
EOF

m dock autohide YES
m dock position LEFT
m dock showdelay 0.2
m dock magnification NO
m dock prune
m finder showhiddenfiles YES
m firewall enable
m hostname macbook

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
