autoload -U compinit && compinit

ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean

# Get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Get the status of the working tree
git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  echo $STATUS
}

function git-alias-shortcuts () {
  sed -n "/^\[alias\]/,/^\[?/ { /^\[/d; /\"/d; s/[[:space:]]*\([[:graph:]]*\)[[:space:]]*=[[:space:]]*\(.*\)$/\1=git \2/p;  }" ~/.gitconfig
}

function git-need-to-push() {
  if pushtime=$(git status | grep 'Your branch is ahead' 2> /dev/null); then
    echo "^ "
  fi
}

function git-branch-name () {
  git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
}

# Show character if changes are pending
git_status() {
  if git status --porcelain | grep '^M ' > /dev/null 2>&1; then
    echo "✹ "  # Indicates modified files
  elif git status --porcelain | grep '^A ' > /dev/null 2>&1; then
    echo "✎ "  # Indicates added files
  elif git status --porcelain | grep '^?? ' > /dev/null 2>&1; then
    echo "? "  # Indicates untracked files
  fi
}

function git-dirty () {
  git status 2> /dev/null | grep "nothing to commit (working directory clean)"
  echo $?
}

function gsrb () {
  branch=$(git-branch-name)
  git checkout master
  git svn rebase
  git checkout "${branch}"
  git rebase master
}

function git-prompt() {
  # Check if we're in a Git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return  # Exit the function if not in a Git repository
  fi

  # Get the git status in a machine-readable format
  gstatus=$(git status --porcelain --branch 2>/dev/null)
  branch=$(echo "$gstatus" | head -1 | sed -E 's/^## ([^ .]+).*/\1/')

  # Determine ahead/behind status
  ahead=$(echo "$gstatus" | grep -o 'ahead [0-9]*' | cut -d' ' -f2)
  behind=$(echo "$gstatus" | grep -o 'behind [0-9]*' | cut -d' ' -f2)

  # Create arrows for ahead/behind
  arrows=""
  [[ -n "$ahead" ]] && arrows="^$ahead"
  [[ -n "$behind" ]] && arrows="$arrows v$behind"

  # Staged/untracked changes
  git_status_output=$(git_status)

  # Output the branch name and indicators
  if [[ -n "$branch" ]]; then
    echo "⭑ $branch $arrows $git_status_output"
  fi
}

function git-scoreboard () {
  git log | grep Author | sort | uniq -ci | sort -r
}

function git-track () {
  branch=$(git-branch-name)
  git config branch.$branch.remote origin
  git config branch.$branch.merge refs/heads/$branch
  echo "tracking origin/$tracking"
}

function github-init () {
  git config branch.$(git-branch-name).remote origin
  git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
}

function github-url () {
  git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
}

# Seems to be the best OS X jump-to-github alias from http://tinyurl.com/2mtncf
function github-go () {
  open $(github-url)
}

function nhgk () {
  nohup gitk --all &
}
