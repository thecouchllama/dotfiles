#!/bin/zsh

if [[ -f "/usr/bin/task" ]]; then
  alias ta="task add"
  alias tn="task next"
  alias tl="task ls"
  alias tln="task ls tag:next"
  alias tp="task projects"
  alias tsum="task summary"
  alias th="task history"

  function td {
          task $1 done
  }

  function tlater {
          task $1 modify +later
  }
  function tdel {
          task $1 delete
  }

  function tap {
          task add project:$*
  }

  function tas {
          task add project:singletons $*
  }

  function tlp {
          task ls project:$*
  }

  function tdep {
          task $1 modify depends:"$2"
  }

  # Autocomplete

  zstyle ':completion:*:*:task:*' verbose yes
  zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
  zstyle ':completion:*:*:task:*' group-name ''
  compdef _task t=task
fi
