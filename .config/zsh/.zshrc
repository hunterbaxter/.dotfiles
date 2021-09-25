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

# aliases
source "$HOME/.dotfiles/.config/zsh/aliases"

# lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
# HISTFILE=~/.histfile
HISTFILE=~/.cache/zsh/history

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/dotfiles/.zshrc'

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
#
# # Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes.
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

# export PATH=$PATH:/usr/local/spark/bin
# export PATH=$PATH:/home/baxterhc/.local/share/coursier/bin
# export PATH=$PATH:/usr/ampl_linux-intel64
path+=('/usr/local/spark/bin')
path+=('/usr/local/ampl')
path+=('/home/baxterhc/.local/share/coursier/bin')
export PATH


source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
