#!/bin/zsh
if uname -a | grep -q 'Darwin'; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias ls="ls -G --group-directories-first"

  if [[ -f /opt/homebrew/bin/ctags ]]; then
    alias ctags="/opt/homebrew/bin/ctags"
  else
    alias ctags="/usr/local/bin/ctags"
fi


