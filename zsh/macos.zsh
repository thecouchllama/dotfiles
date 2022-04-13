if [[ -d /Users ]]; then
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  alias ls="ls -G"

  if [[ -f /opt/homebrew/bin/ctags ]]; then
    alias ctags="/opt/homebrew/bin/ctags"
  else
    alias ctags="/usr/local/bin/ctags"
  fi
fi
