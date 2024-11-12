ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

eval `dircolors ~/Dev/dotfiles/bliss.dircolors`

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
