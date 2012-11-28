eval `dircolors ~/.dircolors`
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

for script in $ZDOTDIR/??_*.zsh
do
  source $script
done
