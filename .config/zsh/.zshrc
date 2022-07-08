# FIX: this should probably be managed better...
setxkbmap -option caps:swapescape

# Navigation
setopt AUTO_CD # Go to folder path without using cd.
setopt AUTO_PUSHD # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT # Do not print the directory stack after pushd or popd.

# beeps bad
unsetopt BEEP
unsetopt LIST_BEEP

# source files for organization
source "$HOME/.dotfiles/.config/zsh/private_aliases"
source "$HOME/.dotfiles/.config/zsh/public_aliases"
source "$HOME/.dotfiles/.config/zsh/completion.zsh"
source "$HOME/.dotfiles/.config/zsh/vi_mode"

setopt INC_APPEND_HISTORY # append command to history file as typed
setopt EXTENDED_HISTORY # sets timestamp and duration for each command
setopt HIST_IGNORE_ALL_DUPS # do not save duplicated command into history list
setopt HIST_REDUCE_BLANKS # remove unnecessary blanks

# magic space (fills in !!)
bindkey ' ' magic-space

# I stored it in a scripts directory I have
source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.poetry/bin:$PATH"
