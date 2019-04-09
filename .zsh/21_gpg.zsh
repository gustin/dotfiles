export GPG_TTY=$(tty)
[ -f ~/.gnupg/gpg-agent-info ] && source ~/.gnupg/gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
      export GPG_AGENT_INFO
    else
      eval $( gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf )
fi
