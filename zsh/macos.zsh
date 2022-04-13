#!/bin/zsh
if uname -a | grep -q 'Darwin'; then
  if [[ -f /opt/homebrew/bin/brew ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  if [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  alias ls="ls -G"

  if [[ -f /opt/homebrew/bin/ctags ]]; then
    alias ctags="/opt/homebrew/bin/ctags"
  else
    alias ctags="/usr/local/bin/ctags"
  fi
fi
