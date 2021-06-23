#!/bin/zsh

if grep -q 'Ubuntu' /etc/lsb-release 2>&1 >/dev/null; then
  alias aptc="sudo apt autoclean"
  alias aptd="sudo apt update && sudo apt dist-upgrade"
  alias aptg="sudo apt update && sudo apt upgrade"
  alias apti="sudo apt install"
  alias aptr="sudo apt remove"
  alias apts="apt search"
  alias aptu="sudo apt update"
  alias ls="ls --color=always --group-directories-first"
fi
