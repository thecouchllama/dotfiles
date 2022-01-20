#!/bin/zsh

# Override Commands
alias free="free -h"
alias grep="grep --color -i"
alias ping='prettyping --nolegend'
alias vi=nvim

# Ripgrep Aliases
alias rg="batgrep -S"
alias rgi="batgrep -i"
alias rgs="batgrep -s"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias svi="sudo -e"
alias sz="source ~/.zshrc"
alias bd=". bd -si"

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# scp aliases
alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
