#!/bin/zsh

# Override Commands
alias cp="cp -i --reflink=auto"
alias free="free -h"
alias grep="grep --color -i"
alias ls="ls --color=always --group-directories-first"
alias ping='prettyping --nolegend'
alias vi=nvim

# BTRFS DF alias
alias bdf="btrfs filesystem df"

# Ripgrep Aliases
alias rg="batgrep -S"
alias rgi="batgrep -i"
alias rgs="batgrep -s"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias svi="sudo -e"
alias sz="source ~/.zshrc"

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# ssh aliases
alias copy_terminfo="kitty +kitten ssh "$1" echo COPY terminfo"
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'

# Arch PKG Management
alias pac="sudo pacman -S"
alias pacq="pacman -Q"
alias pacr="sudo pacman -Rs"
alias pacs="pacman -Ss"
alias pacsy="sudo pacman -Sy"
alias pacsyu="sudo pacman -Syu"
alias pacu="sudo pacman -U"
alias ya="yay -S"
alias yas="yay -Ss"
alias yau="yay -Su"

# xdg aliases
alias open="xdg-open"
alias xqf="xdg-mime query filetype"
alias xqd="xdg-mime query default"
alias xd="xdg-mime default"

# exercism
alias es="exercism submit"


# dot aliases
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
