#!/bin/zsh
if [ ! "$TMUX" ] && [ "$TERM" != "xterm-kitty" ]; then
  alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
  alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
fi
