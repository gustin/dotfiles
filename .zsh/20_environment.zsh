export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export EDITOR='vi'
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator


