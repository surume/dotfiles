# Aliases
alias g git
alias d docker
alias fig 'docker compose'
alias k kubecolor
alias ls eza
alias vi nvim
alias vim nvim
alias find fd
alias gip 'curl globalip.me'
alias be 'bundle exec'

# Functions
function ss
    cat ~/.ssh/config ~/.ssh/conf.d/local.nosync/confi* | grep "^Host " | egrep -v 'github.com|bitbucket.org' | sed s/"Host "// | sort | fzf | read -l sshhostname
    sshrc -A $sshhostname
end

function dssh
    docker ps --format "table {{.ID}} {{.Names}}" | grep -v "CONTAINER" | fzf | awk '{print $1}' | read -l container_id
    docker exec -it $container_id /bin/bash
end

function mkrepo
  set -lx repo $MY_GITHUB_ROOT/$argv
  mkdir -p $repo
  cd $repo
  git init
end

function rmrepo
  ghq list -p | fzf -m | xargs -I{} rm -rf {}
end
