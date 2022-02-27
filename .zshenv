# TODO: on a fresh install, .local is not very descriptive
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"

mkdir -p ~/.cache/zsh
export HISTFILE="$XDG_CACHE_HOME/zsh/history" # NOTE: create zsh directory
export HISTSIZE=100000  # maximum events for internal history
export SAVEHIST=100000 # maximum events for history file

path+=('/usr/local/spark/bin')
path+=('/usr/local/ampl')
path+=('/home/baxterhc/.local/share/coursier/bin')
path+=('/usr/local/share/openvswitch/scripts/')
path+=('/home/baxterhc/.local/bin')
path+=('$HOME/.poetry/env`')
export PATH

. "$HOME/.cargo/env"
