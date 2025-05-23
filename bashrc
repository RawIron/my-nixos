# group - no write
# other - no read, no write, no execute
umask 0027

# use vi as command-line editor
set -o vi

# keep the history small
# 	no duplicate entries
# 	ignore no-brainer commands
export HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE='ls:ll:cd:pwd:bg:fg:history'

export EDITOR='nvim'
export VISUAL='nvim'

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

export FZF_DEFAULT_OPTS="--preview 'bat --plain --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f"
# Set up fzf shell integration, key bindings and fuzzy completion
[[ $(type -P "fzf") ]] && eval "$(fzf --bash)"

BROOT_LAUNCHER="~/.config/broot/launcher/bash/br"
if [ -f "$BROOT_LAUNCHER" ]; then
    source "$BROOT_LAUNCHER"
fi

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
