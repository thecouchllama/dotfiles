#!/bin/zsh

umask 022
setopt autolist automenu nobeep

# Set Default Editor
export EDITOR="nvim"

# Set Path
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.krew/bin:${PATH}"

# no c-s/c-q output freezing
setopt noflowcontrol
# allow expansion in prompts
setopt prompt_subst
# Disable 'zsh: no matches found' warning
setopt nonomatch
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# not just at the end
setopt completeinword
# use zsh style word splitting
setopt noshwordsplit
# allow use of comments in interactive code
setopt interactivecomments
# Enable extended globs (i.e. **/)
setopt extended_glob
# Enable auto correct for commands
setopt correct
set -o noclobber
# Add colors to less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Set title bar prompt
precmd () {print -Pn "\e]0;%~\a"}
preexec () {print -Pn "\e]0;$1 (%~)\a"}

# Set batcat theme
export BAT_THEME="cobalt2"

# pager settings
export PAGER="less -R"

# Disable homebrew git token request
export HOMEBREW_NO_GITHUB_API=TRUE

# FZF Config
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
