if [[ "$BLINKSH" ]]; then
  ZLE_RPROMPT_INDENT=0

  if [ ! -S ~/.ssh/ssh_auth_sock ] && [ -S "$SSH_AUTH_SOCK" ]; then
    # Start ssh-agent if it's not already running
    [ -z "$SSH_AUTH_SOCK" ] && eval "$(/usr/bin/ssh-agent -s -t 1h)"
    /usr/bin/ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
  fi
  SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"
fi
