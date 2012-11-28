alias pu='pushd'
alias po='popd'

alias ..='cd ..'
alias ...='cd ../..'

alias _='sudo'

alias history='fc -l 1'

alias b='bundle'
alias bu='b update'
alias be='b exec'

alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'

alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gd='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
