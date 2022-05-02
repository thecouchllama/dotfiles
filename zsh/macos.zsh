#!/bin/zsh
if [[ -d /Users ]]; then
	alias ls="ls -G"
  if [ -f "/opt/homebrew/bin/brew" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	alias ctags="/opt/homebrew/bin/ctags"
elif [ -f "/usr/local/bin/brew" ]; then
	eval "$(/usr/local/bin/brew shellenv)"
	alias ctags="/usr/local/bin/ctags"
  fi

fi
