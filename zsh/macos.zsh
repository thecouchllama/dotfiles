if [[ -d /Users ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	alias ls="ls -G"
	alias ctags="/opt/homebrew/bin/ctags"
fi
