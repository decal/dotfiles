# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL='ignorespace:erasedups'

# append to the history file, don't overwrite it
# shopt -s checkwinsize cmdhist complete_fullquote expand_aliases extglob extquote force_fignore histappend his
# treedit interactive_comments lithist login_shell progcomp promptvars sourcepath

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4096
HISTFILESIZE=8192

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color'
    alias dir='dir --color'
    alias vdir='vdir --color'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ccaout='gcc -O2 -fopenmp -Wall -o $1 $1.c && ./$1'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

umask 0027

## TODO: make this a function that takes username as first arg and repo as second
## TODO: add this and any other related aliases that need to be made to githose repo

function clone {
  [ ! $2 ] && echo "usage: clone USER REPO" && return 1

  for r in $*
    do nice git clone --verbose -- "https://github.com/${1}/${r}"
  done
}

function maxnice {
  renice -n -20 `pidof $*`
}

function remirrors {
  [ ! $1 ] && echo "usage: remirror MIRDIR" && return 1

  for urlstr in $(find $1 -type d -print)
    do nice wget --tries=4 -4 -m -np -nc --no-check-certificate -- "https://${urlstr}"
  done

  return 0
}

function remirror {
  [ ! $1 ] && echo "usage remirror MIRDIR" && return 1

  for urlstr in $(find $1 -type d -print)
    do nice wget --tries=4 -4 -m -np -nc -- "http://${urlstr}"
  done

  return 0
}

function pipx() {
  /usr/bin/pip3 $*
  /usr/bin/pip $*
}

export LD_LIBRARY_PATH='/home/decal/local/lib:/usr/local/lib'
export RUBYLIB='/home/decal/GIT/decal/zap-attack/lib:/home/decal/GIT/decal/aemscanio/lib:/home/decal/GIT/decal/combos_permutedirs/lib:/home/decal/GIT/decal/dirverser/lib:/home/decal/GIT/decal/percent_encode/lib:/home/decal/GIT/decal/filb/lib:/home/decal/code/rb/helpshow/lib'
export GIT_EDITOR='/usr/bin/vim'

set -o vi

#export LIBRE_COMPILE=' -I/home/decal/local/include -L/home/decal/local/lib -lssl -lcrypto'
#export OSSL_COMPILE='  -I/usr/local/src/openssl-1.1.0f/include -L/usr/local/lib -lssl -lcrypto'

#export HTTPS_PROXY='one.proxy.att.com:8080'
#export https_proxy="$HTTPS_PROXY"
#export http_proxy="$https_proxy"
#export HTTP_PROXY="$http_proxy"
#export FS='/home/decal/GITLAB/decal/IOAemScan/bin/finalstage.att.com/'
#export HTTPS='https://finalstage.att.com/'
#export HTTP='http://finalstage.att.com/'

#export net="riteaid.net"
#export NET="riteaid.net"

#export org="riteaid.org"
#export ORG="riteaid.org"

#export com="riteaid.com"
#export COM="riteaid.com"

source $HOME/code/bash/bash_aliases

function echo_shopt {
  echo shopt -u $(shopt | egrep 'off$' | awk '{print$1}' | tr '\n' ' ')
  echo shopt -s $(shopt | egrep 'on$' | awk '{print$1}' | tr '\n' ' ')
}

shopt -u autocd cdable_vars cdspell checkhash checkjobs compat31 compat32 compat40 compat41 compat42 direxpand dirspell dotglob execfail extdebug failglob globasciiranges gnu_errfmt histverify hostcomplete huponexit lastpipe mailwarn no_empty_cmd_completion nocaseglob nocasematch nullglob restricted_shell shift_verbose xpg_echo
shopt -s checkwinsize cmdhist complete_fullquote expand_aliases extglob extquote force_fignore globstar histappend histreedit interactive_comments lithist login_shell progcomp promptvars sourcepath

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/decal/google-cloud-sdk/path.bash.inc' ]; then source '/home/decal/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/decal/google-cloud-sdk/completion.bash.inc' ]; then source '/home/decal/google-cloud-sdk/completion.bash.inc'; fi

echo 'Write WAF that enforces Access-Control-Allow-Origin and other security headers'
