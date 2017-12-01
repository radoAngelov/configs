source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1='\n$PWD$(__git_ps1 " \033[0;33m%s\033[0m")$ '

# jump
eval "$(jump shell)"

# shell aliases
alias  la='ls -a'

# bundle aliases
alias  be='bundle exec'
alias  bi='bundle install'
alias  job='bundle exec rake jobs:work'
alias  job1='bundle exec rake jobs:workoff'
alias  rs='bundle exec rspec'

# fidor aliases
alias  staba='EVENT_NOTIFIER_REGISTRY=generic PROJECT=generic LOCALE=en bundle exec rails server -b 0.0.0.0 --port=3000'
alias  stadap='bundle exec rails s -p 7000'
alias  stonb='bundle exec rails s -p 6000'
alias  stapi='bundle exec puma -C config/puma.rb'
alias  stauth='bundle exec rails s'
alias  stoff='bundle exec rails s -p 3004'

# start fidor apps with script
alias  ]]='bash ~/start.sh'

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

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ssh to servers aliases
alias  stage1='ssh deploy@s-ffr-swr-docker01.fidor.intern'
alias  stage2='ssh deploy@s-ffr-swr-docker02.fidor.intern'
alias  stage3='ssh deploy@s-ffr-swr-docker03.fidor.intern'
alias  stage4='ssh deploy@s-ffr-swr-docker04.fidor.intern'
alias  stageman='ssh deploy@10.1.20.10'
alias  prod1='ssh deploy@p-ffr-swr-docker01.fidor.intern'
alias  prod2='ssh deploy@p-ffr-swr-docker02.fidor.intern'
alias  prod3='ssh deploy@p-ffr-swr-docker03.fidor.intern'
alias  prod4='ssh deploy@p-ffr-swr-docker04.fidor.intern'
alias  dockerscr='ssh deploy@10.1.14.1'
alias  sbx='ssh deploy@d-ffr-sbx-rails01.fidor.intern'
alias  shadow='ssh deploy@p-ffr-shw-app01.fidor.intern'
alias  sshtest='ssh deploy@t-ffr-sbx-rails01.fidor.intern'