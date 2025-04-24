typeset -U path

path=(
	$path
	/home/jpadron/go/bin
	/opt/nvim/bin
	~/.cargo/bin/alacritty
	/home/jpadron/.local/kitty.app/bin
	$HOME/.local/bin
	/usr/local/go/bin
	/home/juan/.deno/bin
)

export EDITOR=$(which nvim)

. "$HOME/.cargo/env"
