
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:/Users/decal/homebrew/bin:/Users/decal/homebrew/opt/go/libexec/bin:/Users/decal/.cargo/bin"
#BASHISHDIR="/Users/decal/homebrew/Cellar/bashish/2.2.4/share/bashish"                 ## line added by bashish
#TTY=`tty 2>/dev/null` && if test "x$BASHISHDIR" != x;then       ## line added by bashish
#test "$BASHISH_OLDPATH"||BASHISH_OLDPATH="$PATH"                ## line added by bashish
#PATH="$HOME/.bashish/launcher:$BASHISHDIR/lib:$BASHISH_OLDPATH:$GOPATH/bin" ## line added by bashish
#BASHSISH_CP=437                                                 ## line added by bashish
#TEST_TERM="$TERM" _bashish_utfcheck && BASHISH_CP=utf8          ## line added by bashish
#ENV="$HOME/.profile"                                            ## line added by bashish
#export BASHISH_CP BASHISH_OLDPATH TTY ENV                       ## line added by bashish
#. "$BASHISHDIR/main/prompt/sh/init"                             ## line added by bashish
#fi                                                              ## line added by bashish
export HOMEBREW=/Users/decal/homebrew
export HB="$HOMEBREW"
export PDFTK=/usr/local/bin/pdftk
export MOSH_PREDICTION_DISPLAY=adaptive

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# tail ~/TODO

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Don't put duplicate lines or lines starting with space in the history; see bash(1) for more info
export HISTCONTROL='ignorespace:erasedups:ignoredups' HISTIGNORE='history*:. *'
# these are export in an attempt to stop script kiddies from avoiding bash history
export HISTSIZE=4096 HISTFILESIZE=8192 
export HISTTIMEFORMAT='%M-%d-%Y %H:%M:%S ' HISTFILE='~/.bash_history'

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@UFO\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@UFO:\w\$ '
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias aout='gcc -O2 -fopenmp -Wall -o $1 $1.c && ./$1'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls colors
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
# for MacOS ls
export CLICOLOR=1

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

function cater {
  for f in "$*"
    do coderay $f
  done

  return 0
}

# path_prepend, path_append and mkcd are from https://github.com/uberspot/dotfiles
path_prepend() {
    if test -d "$1"; then
        PATH="$1:$PATH"
    fi
}

path_append() {
    if test -d "$1"; then
        PATH="$PATH:$1"
    fi
}

mkcd() {
    mkdir -p "$1"
    builtin cd "$1"
}


# Download an individual file from GitHub
function ghfile {
  if [ ! "$3" ]
    then echo
    echo "usage: $0 USER REPO PATH"
    echo
    echo '  USER  user name of account to download file from'
    echo '  REPO  the repository of the project file is in'
    echo '  PATH  path to file within given repository'
    echo
    echo 'ex. ghfile decal werdlists software-strs/README.md'
    echo

    return 1
  fi

  wget -k --continue --show-progress -- "https://raw.githubusercontent.com/${1}/${2}/master/${3}"

  return $?
}

function compile {
  if [ ! "$1" ]
    then echo 
    echo "usage: $0 FILE"
    echo
    echo '  FILE  name of source code file to compile'
    echo
    echo 'ex. compile hello.c'
    echo

    return 1
  fi

  declare aout=`basename $1 .c`

  gcc -O2 -fopenmp -Wall -pedantic -o "$aout" "$1"

  return $?
}

function header {
  coderay $1 | head -n 20
}

function tailer {
  coderay $1 | tail -n 20
}

function lesser {
  coderay $1 | most
}

function timeout() { perl -e 'alarm shift; exec @ARGV' "$@"; }

## TODO: add this and any other related aliases that need to be made to githose repo
## TODO: move all functions into .bash_functions
function clone {
  [ ! "$2" ] && echo "usage: clone USER REPO [REPO2 [...]" && return 1

  local auser="$1" 
  local -i aretn=0

  shift

  for r in $*
    do git clone -v "https://github.com/${auser}/${r}" & 2>/dev/null

    [ $? -gt 0 ] && aretn+=$?
  done

  return $aretn
}

function pull {
  local -i aretn=0 nargs=$#

  [ ! $1 ] && echo "usage: pull DIR [DIR2 [...]]" && return 1

  for d in $*
    do cd "$d"
    git pull -v &
    cd ..
  done

  for n in `seq 1 $nargs`
    do wait
    [ $? -gt 0 ] && aretn+=$?
  done

  return $aretn
}

function maxnice {
  renice -n -20 `pidof $*`

  return $?
}

function remirrors {
  [ ! "$1" ] && echo "usage: remirrors HOSTDIR" && return 1

  local -i aretn=0

  for urlstr in $(find $1 -type d -print)
    do nice wget --tries=2 -4 -m -np -nc -k -- "https://${urlstr}"

    [ $? -gt $aretn ] && aretn+=$?
  done

  return $aretn
}

function remirror {
  [ ! "$1" ] && echo "usage: remirror HOSTDIR" && return 1

  local -i aretn=0

  for urlstr in `find $1 -type d -print`
    do nice wget --tries=2 -4 -m -np -nc -- "http://${urlstr}"

    [ $? -gt 0 ] && aretn+=$?
  done

  return $aretn
}

function pipx {
  local -i rc=0

  /usr/bin/pip3 $*
 
  [ $? -ne 0 ] && rc=$?

  /usr/bin/pip $*

  [ $? -ne 0 ] && rc=$?

  return $rc
}

# grep through the output of an apt-cache command for parallel programming related items
function apt-cache-para() {
  [ ! $1 ] && echo "usage: ${0} apt-cache-para [OPTIONS] COMMAND" && return 1

  apt-cache $* | egrep -i '(concur|para|thread|LWP|proc|fiber|event|block|async)'

  return $?
}

export CDPATH='.:~:~/GIT/decal:~/GITLAB/decal/:~/repos:~/gists:~/github:~/cmds'
export GOPATH='/opt' GOOS=linux GOARCH=amd64
export GOROOT="$GOPATH/go" 
export LD_LIBRARY_PATH='~/lib:~/local/lib:/usr/local/lib:/opt/lib:/opt/local/lib'
export RUBYLIB='~/GIT/decal/zap-attack/lib:~/GIT/decal/aemscanio/lib:~/GIT/decal/combos_permutedirs/lib:~/GIT/decal/dirverser/lib:~/GIT/decal/percent_encode/lib:~/GIT/decal/filb/lib:'
export EDITOR=/usr/bin/vim PAGER=/usr/bin/less
export GIT_EDITOR="$EDITOR" GIT_PAGER="$PAGER"
export MAKEFLAGS='-j4' MOST_SWITCHES='-t'
export LESS='-irP "?f%f .?ltLine %lt:?pt%pt\%:?btByte %bt:-..."' 
# Each history-related variable is exported individually to prevent log evasion
export LESSHISTSIZE=128
export GREP_OPTIONS='--color=always'

set -o vi
set visible-stats=on colored-stats=on completion-ignore-case=on completion-query-items=256 mark-symlinked-directories=on mark-modified-lines=on

export OPTERR=1 IGNOREEOF=2 FIGNORE='.o:~:.core:.swp:#:-:.dpkg-new' # TMOUT=4

function echo_shopt {
  echo shopt -u $(shopt | egrep 'off$' | awk '{print$1}' | tr '\n' ' ')
  echo shopt -s $(shopt | egrep 'on$' | awk '{print$1}' | tr '\n' ' ')

  return 0
}

if [ `uname -s` != 'Darwin' ]
  then shopt -u autocd cdable_vars cdspell checkhash checkjobs compat31 compat32 compat40 compat41 compat42 direxpand dirspell dotglob execfail extdebug failglob globasciiranges gnu_errfmt histverify hostcomplete huponexit lastpipe mailwarn no_empty_cmd_completion nocaseglob nocasematch nullglob restricted_shell shift_verbose xpg_echo
  shopt -s checkwinsize cmdhist complete_fullquote expand_aliases extglob extquote force_fignore globstar histappend histreedit interactive_comments lithist login_shell progcomp promptvars sourcepath
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# The next line updates PATH for the Google Cloud SDK.
#source '/home/decal/google-cloud-sdk/path.bash.inc' 2>/dev/null

# The next line enables shell command completion for gcloud.
#source '/home/decal/google-cloud-sdk/compleion.bash.inc' 2>/dev/null

# autocompletion
which pandoc; [ $? -eq 0 ] && eval "$(pandoc --bash-completion)"

export PATH="/home/decal/bin:/usr/lib/go-1.6/bin:${HOME}/homebrew/bin:${HOME}/.linuxbrew/bin:/home/decal/perl5/bin:/home/decal/perl5/perlbrew/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin"

# Less colors.. makes man pages easier to read!
export LESS_TERMCAP_mb=$'\E[01;31m'    LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'        LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m' LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Path name shortcuts for WSL
if [ `uname -s` != 'Darwin' ]
  then
  export PERL_LOCAL_LIB_ROOT="/home/decal/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_MB_OPT='--install_base "/home/decal/perl5"' PERL_MM_OPT='INSTALL_BASE=/home/decal/perl5'
  export PERL5LIB="/home/decal/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export DECAL='/mnt/c/Users/decal' DESKTOP='/mnt/c/Users/decal/Desktop' DOWNLOADS='/mnt/c/Users/decal/Downloads'
else
  export PERL_LOCAL_LIB_ROOT="/Users/decal/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_MB_OPT='--install_base "/Users/decal/perl5"' PERL_MM_OPT='INSTALL_BASE=/Users/decal/perl5'
  export PERL5LIB="/Users/decal/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export DECAL='/Users/decal' DESKTOP='/Users/decal/Desktop' DOWNLOADS='/Users/decal/Downloads'
fi
