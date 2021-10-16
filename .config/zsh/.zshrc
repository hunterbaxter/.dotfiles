# initializes the promp system promptinit
autoload -U promptinit 

# always start with tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

# navigation
setopt AUTO_CD

# nvim
export EDITOR="nvim"
export VISUAL="nvim"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# import aliases from alias file
source "$HOME/.dotfiles/.config/zsh/aliases"


# HISTORY: `man zshoptions` for descriptions
# if ~/.cashe/zsh directory doesn't exist, will break
HISTFILE=~/.cache/zsh/history
# number of items for internal history list
HISTSIZE=100000
# max number of items for history file
SAVEHIST=100000
# append command t ohistory file as typed 
setopt INC_APPEND_HISTORY
# sets timestamp and duration for each command
setopt EXTENDED_HISTORY
# do not save duplicated command into history list
setopt HIST_IGNORE_ALL_DUPS
# remove unnecessary blanks
setopt HIST_REDUCE_BLANKS

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/dotfiles/.zshrc'

# magic space
bindkey ' ' magic-space

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall


# # Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes. C&Ped. idk how it works
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# This adds things to our path. First is bash way, second is zsh way
# export PATH=$PATH:/usr/local/spark/bin
# export PATH=$PATH:/home/baxterhc/.local/share/coursier/bin
# export PATH=$PATH:/usr/ampl_linux-intel64
path+=('/usr/local/spark/bin')
path+=('/usr/local/ampl')
path+=('/home/baxterhc/.local/share/coursier/bin')
export PATH

source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
