# group - no write
# other - no read, no write, no execute
umask 0027

# use vi as command-line editor
set -o vi

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE

# true color, 24-bit
#PS1="%F{#11D116}%B[%n@%m:%~]$ %b%f"
# 256 colors, 8-bit
PS1="%F{002}%B[%n@%m:%~]$ %b%f"

export EDITOR='nvim'
export VISUAL='nvim'

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

export FZF_DEFAULT_OPTS="--preview 'bat --plain --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f"
# Set up fzf shell integration, key bindings and fuzzy completion
[[ $(command -v "fzf") ]] && eval "$(fzf --zsh)"

BROOT_LAUNCHER="~/.config/broot/launcher/zsh/br"
if [ -f "$BROOT_LAUNCHER" ]; then
    source "$BROOT_LAUNCHER"
fi

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
