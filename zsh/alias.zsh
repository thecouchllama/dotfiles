#!/bin/zsh

# Override Commands
alias free="free -h"
alias grep="grep --color -i"
alias ls="ls --color=always --group-directories-first"
alias ping='prettyping --nolegend'
alias vi=nvim

# Ripgrep Aliases
alias rg="rg -S"
alias rgi="rg -i"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias svi="sudo -e"
alias sz="source ~/.zshrc"

# bat aliases
if which batcat 2>&1 >/dev/null; then
  alias cat='batcat -p --pager=never --theme=cobalt2'
  alias catl='batcat --pager=never --theme=cobalt2'
  alias catp='batcat --theme=cobalt2'
else
  alias cat='bat -p --pager=never --theme=cobalt2'
  alias catl='bat --pager=never --theme=cobalt2'
  alias catp='bat --theme=cobalt2'
fi

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
