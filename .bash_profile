# Read this when bash is initialized as a login shell

# octal file creation mode mask
umask 0027

[ -f ~/.bashrc ] && source ~/.bashrc

# minimize permission bits on history files
chmod -c 0600 -- ~/.*hist*

# autocompletion
eval "$(pandoc --bash-completion)"

function colorize {
  local STRING="$1" COLOR="$2" BOLD="$3"

  local COLORS=( BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE )
  local CC="\e[0m" # Default no color
  local INDEX=0;

  if [ $BOLD != 0 ]; then BOLD=1; else BOLD=0; fi

  for C in "${COLORS[@]}"; do
    if [ "$C" == "$COLOR" ]; then
      local CC="\e[$BOLD;$((30 + $INDEX))m"
      echo -en "$CC$STRING\e[m"
      return;
    fi
    INDEX=$(($INDEX+1))
  done

  echo -n "$CC$STRING\e[m"
}

function parse_git_branch {
  local BRANCH ERRCODE

  BRANCH=$(git symbolic-ref HEAD 2> /dev/null) || return
  BRANCH=${BRANCH#refs/heads/}

  local GITPROMPT=$BRANCH

  # Staged changes but not committed
  `git diff --cached --quiet 2>/dev/null >&2`; ERRCODE=$?;

  if [ $ERRCODE -eq 1 ] 
  then
    GITPROMPT=$GITPROMPT'|'$(colorize 'staged' 'RED' 0)
  fi

  # Changes not added and not committed
  `git diff-files --quiet 2>/dev/null >&2`; ERRCODE=$?;

  if [ $ERRCODE -eq 1 ] 
  then
    GITPROMPT=$GITPROMPT'|'$(colorize 'unstaged' 'RED' 0)
  fi

  # Files not added, untracked and not in .gitignore
  `git ls-files --exclude-standard --others --error-unmatch . 2>/dev/null >&2`; ERRCODE=$?;
  if [ $ERRCODE -eq 0 ]
  then
    GITPROMPT=$GITPROMPT'|'$(colorize 'untracked' 'GREEN' 0)
  fi

  # All is well and clean
  if [ "$GITPROMPT" = "$BRANCH" ]
  then
    GITPROMPT=$GITPROMPT'|'$(colorize "\xE2\x9C\x93" "GREEN" 1)
  fi

  echo -n "($GITPROMPT)"
}

function enable-git-prompt {
  export PS1OLD="$PS1"
  export PS1="$(colorize "\u@\h" "GREEN" 0) $(colorize "(\$(date +%H:%M))" "WHITE" 1) $(colorize "\w" "BLUE" 1) \$(parse_git_branch)\n\$ "
}

function disable-git-prompt {
  export PS1GIT="$PS1"
  export PS1="$PS1OLD"
}
