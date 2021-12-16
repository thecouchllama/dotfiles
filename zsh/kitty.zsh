#!/bin/zsh

if [ "$TERM" == "xterm-kitty" ]; then
  alias ssh="kitty +kitten ssh"
  alias sshnh='kitty +kitten ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
  alias sshnhr='kitty +kitten ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
i
