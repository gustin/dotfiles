for script in $ZDOTDIR/??_*.zsh
do
  source $script
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/gustin/Library/Preferences/org.dystroy.broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gustin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gustin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gustin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gustin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
