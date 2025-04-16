# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
# HISTSIZE=1000
# SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt +o nomatch
setopt appendhistory
setopt sharehistory
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300


# Use modern completion system
# autoload -Uz compinit
# compinit
#

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zinit ice atinit'zmodload zsh/zprof'

autoload -U compinit && compinit
zinit light romkatv/zsh-defer
# https://github.com/zimfw/environment
zinit light zimfw/environment
# https://github.com/zimfw/input
zinit light zimfw/input
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zsh-defer zinit snippet OMZP::nvm

zstyle 'omz:plugins:nvm' lazy yes
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':zim:input' double-dot-expand no
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
#
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="$PATH:$HOME/go/bin:/opt/nvim/bin:~/.cargo/bin/alacritty:$HOME/.local/kitty.app/bin:$HOME/.local/bin:/usr/local/go/bin"

export EDITOR="nvim"

export GOPRIVATE="gitlab.intelygenz.com"

alias ls='ls --color'
alias la='ls -la'
alias ..='cd ..'

CODE_PATH="$HOME/code"
alias cdc="cd $CODE_PATH"
alias cdw="cd $CODE_PATH/work"
alias cdp="cd $CODE_PATH/personal"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/miniconda3/bin:$PATH"
zsh-defer load_conda

zsh-defer . "$HOME/.deno/env"

function load_conda() {
	# !! Contents within this block are managed by 'conda init' !!
	# >>> conda initialize >>>
	__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
			eval "$__conda_setup"
	else
			if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
					. "$HOME/miniconda3/etc/profile.d/conda.sh"
			else
					export path="$HOME/miniconda3/bin:$path"
			fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

function git_last_commit() {
	git log | awk '{print $2}' | head -1 | xclip -sel clip
}

# zprof
