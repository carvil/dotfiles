# Enable colors in the terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Configure my prompt
export PS1="\[\033[0;32m\]\u\[\033[0m\] @ \W$ "

# Export MacVim
export PATH=$PATH:/Applications/MacVim-snapshot-64/
# Export RabbitMQ
#export PATH=$PATH:/usr/local/Cellar/rabbitmq/2.5.1/sbin/

export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/usr/local/sbin/

# Adding p4merge to the path
export PATH=$PATH:/Applications/p4/p4merge.app/Contents/MacOS/

#to have node libraries picked up.
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/

# Configure the terminal tab's name
export PROMPT_COMMAND='echo -ne "\033]0;${USER} @ ${PWD/#$HOME/~}\007"'

# Setup bundler default editor
export BUNDLER_EDITOR='mvim'

# Enable git autocomplete
source ~/git-completion.bash

alias gco='git co'
alias gci='git ci'
alias grb='git rb'

# For redcarpet
alias gcc-4.2='gcc'

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
