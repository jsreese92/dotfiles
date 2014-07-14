# prints actual path to directory, ignoring symlinks
alias pwd='pwd -P'
# preserves time-stamp and confirms over-write
alias cp='cp -ip'
# forces creation of sub-directories if they don't exist
alias mkdir='mkdir -p'
# lists in color and with slashes indicating directories
alias ls='ls -GF'
# overrides default zsh la
alias la='ls -a'
# lists by time
alias lt='ls -tlh'
# makes cd follow actual path instead of symlinks
alias cd='cd -P'
# grep ignore case with color
alias grep='grep -i'

# removes temp files before launching tmux
# alias tmux='rm -rf /tmp/tmux* && tmux'

# ZSH_THEME="robbyrussell_j"
