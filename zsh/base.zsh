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
export GOPATH="${HOME}/go"
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
  path+="$i/bin"
done

for i in ${HOME}/.gem/ruby/*; do
  path+="$i/bin"
done

typeset -U PATH
export PATH
