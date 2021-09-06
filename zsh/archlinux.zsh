#!/bin/zsh

if [[ -f "/etc/arch-release" ]]; then

  export PATH="$PATH:/var/lib/snapd/snap/bin"

  # Use qt4-ssh-askpass for ssh ask dialog
  export SSH_ASKPASS="/usr/bin/qt4-ssh-askpass"

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

  alias ls="ls --color=always --group-directories-first"

  # BTRFS DF alias
  alias bdf="btrfs filesystem df"

  # Useful when copying files on a COW-enabled file system
  alias cp="cp -i --reflink=auto"

  # Other aliases
  alias open="xdg-open"
  alias xqf="xdg-mime query filetype"
  alias xqd="xdg-mime query default"
  alias xd="xdg-mime default"

  # Ecrypt
  alias mpriv='ecryptfs-mount-private; cd ~/Private'
  alias upriv='cd ~; ecryptfs-umount-private'

  # Source linux brew if it's installed
  if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  # Start ssh-agent if it's not already running
  [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
fi
