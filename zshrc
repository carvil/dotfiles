# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# My theme
ZSH_THEME="carvil"

# Load plugins
plugins=(git osx gem rbenv bundler brew)

# oh-my-zsh configs
source $ZSH/oh-my-zsh.sh

# Add rbenv to the path
export PATH="$PATH:~/.rbenv/bin"
eval "$(rbenv init -)"

# Export MacVim
export PATH=$PATH:/Applications/MacVim-snapshot-64/

# Adding p4merge to the path
export PATH=$PATH:/Applications/p4/p4merge.app/Contents/MacOS/

# Using vim as default editor
export EDITOR="vim"
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# smart cd
setopt AUTO_CD

# github username
export GITHUB_USER="carvil"
