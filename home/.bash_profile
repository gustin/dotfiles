ARCHFLAGS='-arch x86_64'
PATH=/usr/local/pgsql/bin:/usr/local/sbin:$PATH

alias g='git'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git put'

# git branch auto-complete
_complete_git() {
  if [ -d .git ]; then
    branches=`git branch -a | cut -c 3-`
    tags=`git tag`
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${branches} ${tags}" -- ${cur}) )
  fi
}
complete -F _complete_git git checkout


# move files to trash instead of deleting permanetly
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}


if [[ -s /Users/gustin/.rvm/scripts/rvm ]] ; then source /Users/gustin/.rvm/scripts/rvm ; fi
