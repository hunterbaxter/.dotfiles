# FIX: this should probably be managed better...
setxkbmap -option caps:swapescape

# man zshoptions
setopt AUTO_CD
# setopt NOMATCH
# setopt PROMPT_SUBST
# setopt MENU_COMPLETE
# setopt EXTENDED_GLOB # although I probably want
unsetopt BEEP
unsetopt LIST_BEEP

# choices
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"

# source files for organization
source "$HOME/.dotfiles/.config/zsh/private_aliases"
source "$HOME/.dotfiles/.config/zsh/public_aliases"
source "$HOME/.dotfiles/.config/zsh/completion.zsh"
source "$HOME/.dotfiles/.config/zsh/vi_mode"

# HISTORY: `man zshoptions` for descriptions
# if ~/.cashe/zsh directory doesn't exist, will break, so make it
mkdir -p ~/.cache/zsh
HISTFILE=~/.cache/zsh/history
# number of items for internal history list
HISTSIZE=100000
# max number of items for history file
SAVEHIST=100000
# append command to history file as typed
setopt INC_APPEND_HISTORY
# sets timestamp and duration for each command
setopt EXTENDED_HISTORY
# do not save duplicated command into history list
setopt HIST_IGNORE_ALL_DUPS
# remove unnecessary blanks
setopt HIST_REDUCE_BLANKS

# magic space (fills in !!)
bindkey ' ' magic-space

path+=('/usr/local/spark/bin')
path+=('/usr/local/ampl')
path+=('/home/baxterhc/.local/share/coursier/bin')
path+=('/usr/local/share/openvswitch/scripts/')
path+=('/home/baxterhc/.local/bin')
export PATH

source "$HOME/.dotfiles/scripts/def.sh"

# I stored it in a scripts directory I have
source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
