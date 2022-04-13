#!/bin/bash
set -euo pipefail
echo "[*] Installing homebrew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ -f /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
elif [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "Missing homebrew."
	exit 1
fi

#brew install mosh --HEAD
brew bundle

confdir="${PWD/macos/}"

# Setup nvim directory
mkdir -p ~/.config/nvim/lua 2>/dev/null

# Setup links
for i in init.lua ftplugin snippets vim; do
	ln -s "$confdir"nvim/"$i" ~/.config/nvim/"$i"
done

mkdir -p ~/.config/nvim/lua 2>/dev/null

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

mkdir -p ~/.config/kitty
ln -s "$confdir"macos/kitty.conf ~/.config/kitty/kitty.conf

ln -s "$confdir"misc/digrc ~/.digrc

cp "$confdir"misc/gitconfig ~/.gitconfig

git clone https://github.com/wesbos/cobalt2.git \
	~/.config/bat/themes/cobalt2

ln -s "$confdir"misc/bat ~/.config/bat/config

bat cache --build

mkdir -p ~/.config/karabiner
ln -s "$confdir"macos/karabiner.json ~/.config/karabiner/karabiner.json

mkdir -p ~/.hammerspoon
ln -s "$confdir"macos/hammerspoon.lua ~/.hammerspoon/init.lua
