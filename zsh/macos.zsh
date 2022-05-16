#!/bin/zsh
if [[ -d /Users ]]; then
	alias ls="ls -G"
  if [ -f "/opt/homebrew/bin/brew" ]; then
  	eval "$(/opt/homebrew/bin/brew shellenv)"
  	alias ctags="/opt/homebrew/bin/ctags"
  fi
fi
