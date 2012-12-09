setopt prompt_subst
setopt transient_rprompt

PROMPT="∴ %d
λ%{$reset_color%}%(!.#.) "

RPS1='%{$reset_color%}$(git-prompt)'
	
