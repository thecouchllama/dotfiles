#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GITHUB_USER=thecouchllama

# Install zplug if it doesn't exist
if [ ! -d "$HOME/.zinit" ]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

# zsh plugins
zinit lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q "$PWD"' \
  zsh-users/zsh-completions \
  zsh-users/zsh-history-substring-search \
  pick"z.sh" rupa/z \
  changyuheng/fz \
  depth=2 \
  hlissner/zsh-autopair

# Load personal zsh scripts
zinit ice pick"prompt.zsh" multisrc"zsh/*.zsh zsh/completions/_*"
zinit light ${GITHUB_USER}/dotfiles

# Setup powerlevel 10k prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source ~/.zshrc_local
