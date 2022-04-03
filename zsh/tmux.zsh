#!/bin/zsh

if [ "$TMUX" ]; then

# Renames tmux window to server ssh is being used to connect to
  function ssh() {
    if [ "$TERM" == "screen-256color" ]; then
      TERM=xterm-256color
    fi

    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh $*
    fi

    # rename title back
    tmux rename-window zsh
  }

# Renames tmux window to server ssh is being used to connect to
# Doesn't save key in known_hosts
  function sshnh() {
    if [ "$TERM" == "screen-256color" ]; then
      TERM=xterm-256color
    fi

    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*
    fi

    # rename title back
    tmux rename-window zsh
  }

  function sshnhr() {
    if [ "$TERM" == "screen-256color" ]; then
      TERM=xterm-256color
    fi

    if [ -n "$TMUX" ] # set only if within running tmux
    then
      window_index=$(tmux display-message -p '#I')

      # arbitrary environment variable name to remember ssh args like server
      # hostname so we can connect again.
      session_variable_name="window_${window_index}_ssh_args"

      # save in tmux session variable
      tmux setenv $session_variable_name "${@[-1]}"

      # set window title
      tmux rename-window ${@[-1]}

      # run ssh
      ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*

      # unset variable so new panes don't continue ssh-ing to this server
      tmux setenv -u $session_variable_name
    else
      ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*
    fi

    # rename title back
    tmux rename-window zsh
  }

  # Fix SSH-Agent forwarding and tmux
  if [ ! -S ~/.ssh/ssh_auth_sock ] && [ -S "$SSH_AUTH_SOCK" ] && ssh-add -l | grep -q RSA; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"
  fi
fi
