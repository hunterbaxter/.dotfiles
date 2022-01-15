# completion options
setopt PROMPT_SUBST
setopt AUTO_LIST # Automatically list choices on ambiguous completion
setopt EXTENDED_GLOB # expands ~, #, ^
setopt LIST_PACKED
setopt AUTO_PARAM_SLASH

# load completion
autoload -Uz compinit; compinit;
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"
zmodload zsh/complist
_comp_options+=(globdots) # expands dotfiles
