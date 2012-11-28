if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

. `brew --prefix`/etc/profile.d/z.sh
