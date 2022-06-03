#!/bin/bash
set -euo pipefail
echo "[*] Install apt packages" 
sudo apt install -y build-essential zsh
chsh -s /usr/bin/zsh

echo "[*] Installing homebrew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install mosh --HEAD
brew bundle

confdir="${PWD/ubuntuserver/}"

# Setup nvim directory
mkdir -p ~/.config/nvim/lua 2>/dev/null

# Setup links
for i in init.lua ftplugin snippets vim; do
	ln -s "$confdir"nvim/"$i" ~/.config/nvim/"$i"
done

pushd "$confdir"nvim/lua || exit
for file in *; do
	ln -s "$confdir"nvim/lua/"$file" ~/.config/nvim/lua/"$file"
done
popd || exit

touch ~/.config/nvim/lua/local.lua

pip3 install neovim

# Install plugins
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Create symlinks for zsh configs
ln -s "$confdir"zshrc ~/.zshrc
touch ~/.zshrc_local


ln -s "$confdir"misc/digrc ~/.digrc

cp "$confdir"misc/gitconfig ~/.gitconfig

git clone https://github.com/wesbos/cobalt2.git \
	~/.config/bat/themes/cobalt2

ln -s "$confdir"misc/bat ~/.config/bat/config

ln -s "$confdir"misc/tmux.conf ~/.tmux.conf

bat cache --build
