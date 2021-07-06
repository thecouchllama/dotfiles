#!/bin/zsh

# Override Commands
alias free="free -h"
alias grep="grep --color -i"
alias ping='prettyping --nolegend'
alias vi=nvim

# Ripgrep Aliases
alias rg="batgrep --pager='less -R' -S"
alias rgi="batgrep  --pager='less -R' -i"
alias rgs="batgrep  --pager='less -R' -s"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias svi="sudo -e"
alias sz="source ~/.zshrc"

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# ssh/scp aliases
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
