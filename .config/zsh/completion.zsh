# setopt NOMATCH
setopt PROMPT_SUBST
setopt AUTO_LIST # Automatically list choices on ambiguous completion
setopt EXTENDED_GLOB # expands ~, #, ^

# setopt MENU_COMPLETE

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
_comp_options+=(globdots) # expands dotfiles
