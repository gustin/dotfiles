setopt prompt_subst
setopt transient_rprompt

PROMPT="%d
%{$reset_color%}%(!.#. ➤ ) "

RPS1='%{$reset_color%}$(git-prompt)'
	
