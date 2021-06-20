#!/bin/zsh

# Override Commands
alias free="free -h"
alias grep="grep --color -i"
alias ls="ls --color=always --group-directories-first"
alias ping='prettyping --nolegend'
alias vi=nvim

# Ripgrep Aliases
alias rg="batgrep --pager='less -RF' -S"
alias rgi="batgrep  --pager='less -RF' -i"
alias rgs="batgrep  --pager='less -RF' -s"

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

# Ubuntu Aliases
if grep -q 'Ubuntu' /etc/lsb-release 2>&1 >/dev/null; then
  alias aptc="sudo apt autoclean"
  alias aptd="sudo apt update && sudo apt dist-upgrade"
  alias aptg="sudo apt update && sudo apt upgrade"
  alias apti="sudo apt install"
  alias aptr="sudo apt remove"
  alias apts="apt search"
  alias aptu="sudo apt update"
fi

# MacOS Aliases
if uname -a | grep -q 'Darwin'; then
  alias ctags="/usr/local/bin/ctags"
fi
