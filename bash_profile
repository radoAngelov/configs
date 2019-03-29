source ~/.git-completion.bash
source ~/.git-prompt.sh

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# random emoji to terminal
EMOJIES=(🍺 🥃 🏋️ 🏀 🎉 ☠️  🤡 🤘 🖕 👊 🐰 🐼 🦁 🐮 🐷 );
# replace username with tilde
ME='/Users/radoangelov';
PS1='${EMOJIES[$((RANDOM%15))]} $(echo "${PWD/$ME/~}")$(__git_ps1 " \033[0;33m%s\033[0m") $ '

# Enable jump
eval "$(jump shell bash)"

# shell aliases
alias  la='ls -a'

# bundle aliases
alias  be='bundle exec'
alias  bi='bundle install'
alias  job='bundle exec rake jobs:work'
alias  job1='bundle exec rake jobs:workoff'
alias  rs='bin/rspec'
alias  db-reset='bundle exec rake db:drop db:create db:structure:load db:seed'
alias  rails_pid='cat /Users/radoangelov/code/application/tmp/pids/server.pid'

# bundle functions
# running test suite after master rebase
function master-rs() {
  echo -e "\nInstalling gems after rebase!\n\n"
  printf '%(%Y%m%d%H%M%S)T'
  bundle install
  echo -e "\nPreparing the database for testing!\n\n"
  printf '%(%Y%m%d%H%M%S)T'
  bin/rails db:test:prepare
  echo -e "\nReseting SPRING!\n\n"
  printf '%(%Y%m%d%H%M%S)T'
  bin/spring stop
  echo -e "\nRunning the test suite!\n\n"
  printf '%(%Y%m%d%H%M%S)T'
  bin/rspec
}

# brew aliases
alias  bri='brew install'
alias  brs='brew services'

# git aliases
alias  gs='git status'
alias  gcb='git checkout -b'
alias  gco='git checkout'
alias  camend='git commit --amend'
alias  glogp='git log --oneline --decorate -24'
alias  gdog='git log --decorate --oneline --graph'
alias  gcm='git commit'
alias  gr='git remote'
alias  grv='git remote -v'
alias  gra='git remote add'
alias  gb='git branch'
alias  rebr='git branch -m'
alias  gps='git push'
alias  ga='git add'
alias  greb='git rebase'
alias  grebc='git rebase --continue'
alias  gf='git fetch'
alias  gm='git merge'
alias  squash='git rebase -i'
alias  prev='git checkout @{-1}'
alias  dif='git diff'
alias  gst='git stash'
alias  gstp='git stash pop'
alias  gcherry='git cherry-pick'

# git functions
# push to current branch
function gcur() {
        br=$(git rev-parse --abbrev-ref HEAD)
        echo -e "\nPushing to branch: \033[01;36m${br}\033[0m\n"
        git push origin $br
}

# force push to current branch
function gcurf() {
        br=$(git rev-parse --abbrev-ref HEAD)

  read -p "Is $(echo -e "\033[01;31m${br}\033[0m") the desired branch? [Y/n]: " response
  if [ $response = "y" -o $response = "Y" ]; then
    if [ $br = "master" ]; then
      echo -e "\nGTFO 🖕 You cannot force push to master❗🚫❗\n"
    else
      echo -e "\nForce pushing to branch: \033[01;36m${br}\033[0m\n"
            git push origin --force-with-lease $br
    fi
  else
    echo -e "Your changes are not pushed! Type Y or checkout the desired branch.\n"
  fi
}

# switch branch by given string
function grepco() {
  git checkout $(git branch | grep $1)
}

# pull from master and update configs
function gp-master(){
  git checkout master
  git pull origin master
  cp config/configby.variables.example.yml config/configby.variables.yml
  sed -i '' '1,/receipt-bank.test/s/receipt-bank.test/localhost:3000/' config/configby.variables.yml
  echo -e "\n\033[01;36mConfigby is updated to the latest version and the base URI is:\033[0m\n\n$(head -2 config/configby.variables.yml)"
}

# Add sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# Add bin to PATH
export PATH="/usr/local/bin:$PATH"

# Add rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
