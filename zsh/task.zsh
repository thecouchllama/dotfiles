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
          task sync
  }

  function tlater {
          task $1 modify +later
          task sync
  }
  function tdel {
          task $1 delete
          task sync
  }

  function tap {
          task add project:$*
          task sync
  }

  function tas {
          task add project:singletons $*
          task sync
  }

  function tlp {
          task ls project:$*
          task sync
  }

  function tdep {
          task $1 modify depends:"$2"
          task sync
  }

  # Autocomplete

  zstyle ':completion:*:*:task:*' verbose yes
  zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
  zstyle ':completion:*:*:task:*' group-name ''
  compdef _task t=task
fi
