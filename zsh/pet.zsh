#!/bin/zsh

if which pet >/dev/null 2>&1; then
  function prev() {
    PREV=$(fc -lrn | head -n 1)
    sh -c "pet new `printf %q "$PREV"`"
  }

  function pet-select() {
    BUFFER=$(pet search --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
  }
  zle -N pet-select
  stty -ixon
  bindkey '^s' pet-select

  alias petc="pet search | pbcopy"
  alias petn="pet new -t"
  alias pets="pet search --color"
fi
