# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chankaward"

# Example aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails rake rvm brew cap lein npm gem autojump)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias ruby-httpd='open http://localhost:5000; ruby -run -e httpd . -p 5000'

# MacVim
export VIM_APP_DIR=/Applications
# Finished MacVim environment

# shortcut for psql
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
#export PS1="@\h:\w $"

#sets up theprompt color (currently a green similar to linux terminal)
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ "

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR=mvim

alias gaa='git add --all'
alias gap='git add -p'
alias gb='git branch'
# alias gc='git commit -v'
# alias gca='git commit -a -v'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glod='git log --oneline --decorate'
alias gln="git ln | perl -ple 's/\*/sprintf(\"%2s\", \$n++)/e' | less"
alias gp='git push'
alias gpr='git pull --rebase'
alias grep='grep --color=auto --exclude="*~"'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias reset-authors='git commit --amend --reset-author -C HEAD'
alias vi='vim'
alias ll='ls -l'
alias gmt='git mergetool'
alias gtt='gittower'
alias gbranchdelete="git branch -D"
alias gdu='git checkout develop && git pull origin develop'
alias gmu='git checkout master && git pull origin master'

alias r='rails'
alias g='git'
alias h='heroku'
alias m='mvim'

# deploy
alias deploy-staging="cap staging deploy"
alias deploy-staging-migrations="cap staging deploy:migrations"
alias deploy-staging-rake="cap staging remote:rake"
alias deploy-staging-console="cap staging remote:console"
alias deploy-staging-database-update="cap staging update:database"
alias deploy-staging-log="cap staging remote:run 'tail -n 10 log/staging.log'"
alias deploy-staging-tail-log="cap staging remote:tail_log"

alias deploy-production-log="cap production remote:run 'tail -n 100 log/production.log'"
alias deploy-production="cap production deploy"
alias deploy-production-migrations="cap production deploy:migrations"
alias deploy-production-rake="cap production remote:rake"
alias deploy-production-console="cap remote:console"
alias deploy-production-database-update="cap production update:database"
alias deploy-production-tail-log="cap remote:tail_log"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

