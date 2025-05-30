# Command line shortcuts

# ls
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -lh'     #long list
alias lla='ls -lha'
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias t='tail -f'
alias he='head'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias f='find'
alias fid='find . -type d -name'
alias fif='find . -type f -name'

alias h='history'

alias so='sort'
alias sonr='sort -nr'
alias rrf='rm -rf'

alias p='ps -f'
alias pef='ps -ef'
alias pt='ps --forest'

alias c='cat'
alias cs='pygmentize -g'  # cat with syntax highlighting
alias csn='pygmentize -g -O style=colorful,linenos=1'

alias v='vim'
alias gv='gvim'
alias nv='nvim'
alias vimdiff='nvim -d'


# Quick access to commands, files or directories
alias zshrc='$EDITOR ~/.zshrc'
alias bashrc='$EDITOR ~/.bashrc'
alias vrc='$EDITOR ~/.vimrc'
alias nvrc='$EDITOR ~/.config/nvim/init.vim'

alias alg='alias | grep'
#alias_starts_with() { alias | grep "^$1" }
#alias algs='alias_starts_with'

alias hg='history | grep'
alias pg='ps -ef | grep'

alias tree='tree -C'
alias tedu='tree -C --du -h'


if [ -f ~/.bash_aliases_git ]; then
    source ~/.bash_aliases_git
fi
