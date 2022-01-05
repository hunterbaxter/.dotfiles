# FIX: this should probably be managed better...
setxkbmap -option caps:swapescape
# initializes the promp system promptinit
autoload -U promptinit
promptinit
# allows escape sequences
setopt PROMPT_SUBST

# NO. BEEPS.
unsetopt BEEP
unsetopt LIST_BEEP

# navigation without cd
setopt AUTO_CD

# nvim
export EDITOR="nvim"
export VISUAL="nvim"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# import aliases from alias file
source "$HOME/.dotfiles/.config/zsh/private_aliases"
source "$HOME/.dotfiles/.config/zsh/public_aliases"


# HISTORY: `man zshoptions` for descriptions
# if ~/.cashe/zsh directory doesn't exist, will break, so make it
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

# load completion system
# NOTE: As of now, completion is not working very well
autoload -Uz compinit; compinit;
# zstyle => :completion:function:completer:command:argument:tag
#
# from learning shell scripting with zsh on oreilly
# zstyle ':completion:*' group-name ''
# zstyle ':completion:descriptions' format '%B%d%b'
# zstyle ':completion:messages' format %d
# zstyle ':completion:warnings' format 'No matches for: %d'
# zstyle ':completion:*' completer_expand_complete_correct

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

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
path+=('/usr/local/share/openvswitch/scripts/')
path+=('/home/baxterhc/.local/bin')
export PATH

# I stored it in a scripts directory I have
source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
