eval "$(rbenv init -)"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

. `brew --prefix`/etc/profile.d/z.sh

change () {
  from=$1
  shift
  to=$1
  shift
  for file in $*
  do
    perl -i.bak -p -e "s{$from}{$to}g;" $file
    echo "Changing $from to $to in $file"
  done
}

find-ext() {
  ext=$1
  echo "Finding *.$ext"
  find . -name "*.$ext" -type f
}

remove-ext() {
  ext=$1
  echo "Removing *.$ext"
  find . -name "*.$ext" -type f -delete
}


