# ssh ============================================================================
function ssh
  rm -f ~/.ssh/config
  cat ~/.sshlocal/config ~/.ssh/global.config > ~/.ssh/config
  /usr/bin/ssh $argv
end

function ss
  grep "^Host " ~/.ssh/config | egrep -v 'github.com|bitbucket.org' | sed s/"Host "// | sort | peco | read -l hostname
  ssh -A $hostname
end

function dssh
    docker ps | grep -v "CONTAINER"| fzf | awk '{print $1}' | read -l container_id
    docker exec -it $container_id /bin/bash
end

# git ============================================================================
alias g git
alias ls exa
alias vi nvim
alias vim nvim
hub alias -s | source

function mkrepo
  set -lx repo $MY_GITHUB_ROOT/$argv
  mkdir -p $repo
  cd $repo
  git init
end

function rmrepo
  ghq list -p | peco | read -l selectedRepo
  rm -rf $selectedRepo
end

# docker
alias d docker
alias fig docker-compose
alias k kubectl
# alias dst 'docker stats $(docker ps|grep -v "NAMES"|awk '{ print $NF }'|tr "\n" " ")'

# global ip
alias gip 'curl globalip.me'

# bundle exec
alias be 'bundle exec'
