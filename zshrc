# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/radoangelov/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dotenv
  osx
  rake
  rbenv
  ruby
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enable jump
eval "$(jump shell)"

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

alias ]]="bash ~/start.sh"

export PATH=/usr/local/puma-dev:$PATH
export GPG_TTY=$(tty)

# Add openssl to satisfy higher ruby versions
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
