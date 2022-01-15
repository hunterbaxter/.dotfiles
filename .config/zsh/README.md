# All possible Zsh Config Files
  - $ZDOTDIR/.zshenv
  - $ZDOTDIR/.zprofile
  - $ZDOTDIR/.zshrc
  - $ZDOTDIR/.zlogin
  - $ZDOTDIR/.zlogout

# Zsh read these files in the following order:
  - .zshenv - Should only contain user’s environment variables.
  - .zprofile - Can be used to execute commands just after logging in.
  - .zshrc - Should be used for the shell configuration and for executing commands.
  - .zlogin - Same purpose than .zprofile, but read just after .zshrc.
  - .zlogout - Can be used to execute commands when a shell exit.

# Set Zsh to be default
- Linux

```
chsh -s $(which zsh)
```

- macOS

```
chsh -s $(which zsh)
```

# Plugins
- [bd](https://github.com/Tarrasch/zsh-bd)

```sh
$ mkdir -p $ZDOTDIR/plugins/bd
$ curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > $HOME/.config/zsh/plugins/bd/bd.zsh
```

# Resources and Sources
- [Zsh Install Configure Mouseless article](https://thevaluable.dev/zsh-install-configure-mouseless/)
- [XDG Base Directory on Arch Linux](https://wiki.archlinux.org/title/XDG_Base_Directory)
- [Zsh Performance Analysis](https://htr3n.github.io/2018/07/faster-zsh/)
