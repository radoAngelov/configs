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
alias  bo='EDITOR=subl bundle open'
alias  job='bundle exec rake jobs:work'
alias  job1='bundle exec rake jobs:workoff'
alias  rs='bin/rspec'
alias  covrs='COVERAGE=true bin/rspec'
alias  sid='dos2unix bin/deploy/sidekiq && bin/deploy/sidekiq'
alias  db-reset='bundle exec rake db:drop db:create db:structure:load db:migrate db:seed'
alias  rails-pid='cat /Users/radoangelov/code/application/tmp/pids/server.pid'
alias  ss='ssh -R 80:localhost:3000 ssh.localhost.run'
alias  cov='open coverage/index.html'
alias  cop='bundle exec rubocop'
alias  cop-correct='bundle exec rubocop --safe-auto-correct'

# kubernetes
alias kubedemo='kubectl --kubeconfig=/Users/radoangelov/.kube/demo_cluster.yml'
alias kubestaging='kubectl --kubeconfig=/Users/radoangelov/.kube/staging_cluster.yml'
alias kubeproduction='kubectl --kubeconfig=/Users/radoangelov/.kube/production_cluster.yml'
alias kubeinfrastructure='kubectl --kubeconfig=/Users/radoangelov/.kube/infrastructure_cluster.yml'

# migrations
alias  mig='bin/rails db:migrate'
alias  roll='bin/rails db:rollback'
alias  migdown='bin/rails db:migrate:down'
alias  migup='bin/rails db:migrate:up'
alias  migstat='bin/rails db:migrate:status'

# bundle functions
# running test suite after master rebase
function master-rs() {
	echo -e "\nInstalling gems after rebase!\n\n"
	echo $(date -u)
	bundle install
	sleep 1
	echo -e "\nPreparing the database for testing!\n\n"
	echo $(date -u)
	bin/rails db:test:prepare
	echo -e "\nReseting SPRING!\n\n"
	echo $(date -u)
	bin/spring stop
	echo -e "\nRunning the test suite!\n\n"
	echo $(date -u)
	bin/rspec
}

# brew aliases
alias  bri='brew install'
alias  brs='brew services'

# git aliases
alias  gs='git status'
alias  gcb='git checkout -b'
alias  gco='git checkout'
alias  camend='git commit -S --amend'
alias  glogp='git log --oneline --decorate -24'
alias  gdog='git log --decorate --oneline --graph'
alias  gcm='git commit -S'
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
alias  gmff='git merge --no-ff'
alias  grm='git fetch && git reset --hard origin/master'
alias  grs='git fetch && git reset --hard origin/staging'
alias  gr='git fetch && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
alias  gfm='git fetch && git rebase origin/master'
alias  gez='git add . && git commit -S --amend --no-edit && gcurf'
alias  squash='git rebase -i'
alias  prev='git checkout @{-1}'
alias  dif='git diff --patience'
alias  gst='git stash'
alias  gstp='git stash pop'
alias  gcherry='git cherry-pick'
alias  gcherryc='git cherry-pick --continue'
alias  gcl='git checkout app/ bin/ lib/'
alias  gfix='git commit -S --fixup $(git rev-parse HEAD)'
alias  gfc='git add . && git commit -S --fixup $(git rev-parse HEAD) && gcur'

# kubernetes aliases
alias kubedemo='kubectl --kubeconfig=/Users/radoangelov/.kube/demo_cluster.yml'
alias kubestaging='kubectl --kubeconfig=/Users/radoangelov/.kube/staging_cluster.yml'
alias kubeproduction='kubectl --kubeconfig=/Users/radoangelov/.kube/production_cluster.yml'
alias kubeinfrastructure='kubectl --kubeconfig=/Users/radoangelov/.kube/infrastructure_cluster.yml'

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

# Add docker repo
export DOCKER_REPO="rbdr.io"

# Add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias demossh="bash ~/demossh.sh"
alias ]]="bash ~/start.sh"

export PATH=/usr/local/puma-dev:$PATH
export GPG_TTY=$(tty)
