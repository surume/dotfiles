# ssh ============================================================================
function ss
    cat ~/.ssh/config ~/.ssh/conf.d/local.nosync/confi* | grep "^Host " | egrep -v 'github.com|bitbucket.org' | sed s/"Host "// | sort | fzf | read -l sshhostname
    sshrc -A $sshhostname
end

function dssh
    docker ps --format "table {{.ID}} {{.Names}}" | grep -v "CONTAINER"| fzf | awk '{print $1}' | read -l container_id
    docker exec -it $container_id /bin/bash
end

# git ============================================================================
alias g git
alias ls exa
alias vi nvim
alias vim nvim
alias find fd
hub alias -s | source

function mkrepo
  set -lx repo $MY_GITHUB_ROOT/$argv
  mkdir -p $repo
  cd $repo
  git init
end

function rmrepo
  ghq list -p | fzf -m | xargs -I{} rm -rf {}
end

# docker =========================================================================
alias d docker
alias fig docker-compose
alias k kubecolor
# alias dst 'docker stats $(docker ps | grep -v "NAMES" | awk '{ print $NF }' | tr "\n" " ")'

# global ip ======================================================================
alias gip 'curl globalip.me'

# bundle exec ====================================================================
alias be 'bundle exec'
