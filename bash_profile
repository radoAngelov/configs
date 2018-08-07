source ~/.git-completion.bash
source ~/.git-prompt.sh

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# random emoji to terminal
EMOJIES=(🍺 🥃 🏋️ 🏀 🎉 ☠️ 🤡 🤘 🖕 👊 🐰 🐼 🦁 🐮 🐷);
# replace username with tilde
ME='/Users/radoangelov';
PS1='${EMOJIES[$((RANDOM%15))]}  $(echo "${PWD/$ME/~}")$(__git_ps1 " \033[0;33m%s\033[0m")$ '

# Enable jump
eval "$(jump shell)"

# shell aliases
alias  la='ls -a'

# bundle aliases
alias  be='bundle exec'
alias  bi='bundle install'
alias  job='bundle exec rake jobs:work'
alias  job1='bundle exec rake jobs:workoff'
alias  rs='bundle exec rspec'
alias  db_restart='bundle exec rake db:drop db:create db:migrate db:seed'

# git aliases
alias  gs='git status'
alias  gcb='git checkout -b'
alias  gco='git checkout'
alias  camend='git commit --amend'
alias  glogp='git log --oneline --decorate -24'
alias  goh='git log --graph --abbrev-commit --decorate --date=relative --all'
alias  gcm='git commit -m'
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

# git functions
# push to current branch
function gcur() {
        br=$(git rev-parse --abbrev-ref HEAD)
        echo -e "Pushing to branch: ${br}\n"
        git push origin $br
}

# force push to current branch
function gcurf() {
        br=$(git rev-parse --abbrev-ref HEAD)
        echo -e "Force pushing to branch: ${br}\n"
        git push origin -f $br
}

# Add bin to PATH
export PATH="/usr/local/sbin:$PATH"

# Add rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# start fidor apps with a customized script
alias  ]]='bash ~/start.sh'
