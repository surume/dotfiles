


# ssh ============================================================================
function ssh
  rm -f ~/.ssh/config
  cat ~/.sshlocal/config ~/.ssh/global.config > ~/.ssh/config
  /usr/bin/ssh $argv
end

function ss
  grep "^Host " ~/.ssh/config | egrep -v 'github.com|bitbucket.org' | sed s/"Host "// | sort | peco | read -l hostname
  ssh $hostname
end

# git ============================================================================
alias g git
eval (hub alias -s)

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

# # git branch選択をpecoで
# alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
# # git remotebranch選択をpecoで
# alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'


# vagrant
alias v vagrant

# docker
alias d docker
alias fig docker-compose
# alias dst 'docker stats $(docker ps|grep -v "NAMES"|awk '{ print $NF }'|tr "\n" " ")'

# global ip
alias gip 'curl globalip.me'

# bundle exec
alias be='bundle exec'
