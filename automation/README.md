# Automation
## Ansible requirements
```
ansible-galaxy collection install community.general
```

## [Packages](package_list.yaml)
### System packages
- [ansible](https://docs.ansible.com/): automation
- [blueman](): bluetooth
- [dmenu](): X dynamic menu
- [Jetbrains Mono](https://www.jetbrains.com/lp/mono/) terminal fonts
- [IBM Plex Fonts](https://www.ibm.com/plex/): system fonts
- [i3](https://i3wm.org/): X window manager
- [neovim](https://neovim.io/): text-editor
- [newsboat](): rss reader
- [ranger](): file explorer
- [pandoc](): used to convert different document types
- [sxiv](https://github.com/muennich/sxiv) X image viewer
- [taskWarrior](): manages to-do lists
- [texlive](): latex
- [timeWarrior](): track time
- [tmux](): remote session manager
- [vagrant](): virtualization, probably need virtual box too
- [zathura](): document viewer
- [zsh](): shell

### Flatpak packages
- [anki]() spacial repitition flashcards
- [firefox]() web browser
- [flameshot](https://flameshot.org/): screenshot utility
- [libreoffice]() spreadsheets
- [signal]() "secure" messaging
- [steam]() games
- [zoom]() video calls

### Cargo packages
- [alacritty](https://alacritty.org/): terminal emulator

NOTE: Currently I am using an [alacritty fork](https://github.com/zenixls2/alacritty) that supports ligatures,
as I already invested a lot of time in configuring alacritty, so I didn't want to switch to Kitty or other ligature supporting emulators

- [bat]() better cat
- [btm]() more visual top
- [dust]() better du
- [exa]() better ls
- [git-delta]() better git diff, config in ~/.gitconfig
```
[core]
    editor = nvim
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true  # use n and N to move between diff sections
    light = true    # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)
    line-numbers = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```
- [gping](): plotted ping
- [rg](): better grep
- [procs](https://github.com/dalance/procs): better ps
- [sylua](): lua linter
- [tealdeer](): tldr pages


### Pip packages
- [jupyterlab](): python notebook IDE
- [pandas](): dataframe library
- [numpy](): numerical library
- [matplotib](): basic plotting library
- [black](): python linter
