#!/bin/zsh

umask 022

set -o noclobber
setopt autolist automenu nobeep
setopt completeinword
setopt correct
setopt extended_glob
setopt hash_list_all
setopt interactivecomments
setopt noflowcontrol
setopt nonomatch
setopt noshwordsplit
setopt prompt_subst

export BAT_THEME="cobalt2"
export BROWSER="qutebrowser"
export EDITOR="nvim"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export HISTFILE=~/.zsh_history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export PAGER="less -R"
export SAVEHIST=25000
export ZLE_RPROMPT_INDENT=0
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

path+="${HOME}/.yarn/bin"
path+="/var/lib/snapd/snap/bin"
path+="${GOPATH}/bin"
path=("${HOME}/bin" "${HOME}/.local/bin" "${HOME}/.krew/bin" $path)

for i in ${HOME}/.local/share/gem/ruby/*; do
  if [ -d "$i" ]; then
    path+="$i/bin"
  fi
done

for i in ${HOME}/.gem/ruby/*; do
  if [ -d "$i" ]; then
    path+="$i/bin"
  fi
done

typeset -U PATH
export PATH

# Setup XDG paths and directories based off these paths
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export _Z_DATA="$XDG_DATA_HOME/z"
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export RECOLL_CONFDIR="$XDG_CONFIG_HOME/recoll"
