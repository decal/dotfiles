# Terminal Commands
alias .1='cd ..'
alias ..='cd ..'
alias .2='cd ../..'
alias ...='cd ../..'
alias ....='cd ../..'
alias .....='cd ../../..'
alias ......='cd ../../..'
alias .3='cd ../../..'

# X11 commands
#alias winsize=xwininfo

# Safety Commands
alias rm='rm -I --preserve-root --one-file-system'
#alias mv='mv -i'
#alias cp='cp -i'

# List Commands
alias ls='ls --color -C'
#alias ls1='ls -1'
alias ll='ls -l'
#alias ls-l='ls -l'
alias la='ls -a'
#alias lsa='ls -a'
alias ks=ls

# Directory Creation Commands
alias mkdir='mkdir -pv'
#alias mkdp='mkdir -p'
#alias mkdirp='mkdir -p'

# grep commands
alias grep='grep --color'

# chmod commands
#alias chx='chmod +x'
#alias chw='chmod +w'
#alias chr='chmod +r'

# Update commands
alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'
alias dist-upgrade='sudo apt dist-upgrade -y'
alias auto-remove='sudo apt autoremove -y'
alias UPDATE='update && upgrade && dist-upgrade && autoremove'

# Lock Commands
alias reboot='sudo reboot 00'
alias shutdown='sudo shutdown 00'

# Install commands
alias install='sudo apt install'
alias fixdpkg='sudo dpkg --configure -a'

# Git Commands
alias add="git add $*"
alias commit='git commit -m'
alias push='git push'

# Ping Commands
#alias ping='ping -c 5'
#alias fping='ping -c 100 -s.2'

# Vim commands
alias vi=vim
alias svi='sudo vi'
alias svim='sudo vim'
alias sbash='sudo bash'
alias edit=vim

# Python commands
alias python3="python3.5 -OO"
alias python2="python2 -OO"

## TODO: write gith function so 'gith clone' works..
alias gith-clone="git clone --verbose --recurse-submodules --no-single-branch --progress -- \"https://github.com/${BASH_ARGV[1]}/${BASH_ARGV[2]}\""

alias start="/mnt/c/Windows/System32/cmd.exe /c START /MAX /NODE 0 /D 'C:\Users\decal\AppData\Local\lxss\home\decal' /I /ABOVENORMAL"

## Typos

# PAGER commands
#alias More=more MORE=more mORE=more
#alias Less=less LESS=less lESS=less
#alias Most=most mOST=most MOST=most

# host
alias hots=host Host=host 
#alias hots=host Host=host Hots=host HOST=host HOTS=host hOST=host hOTS=host
# shopt -s checkwinsize cmdhist complete_fullquote expand_aliases extglob extquote force_fignore histappend his
# enable color support of ls and also add handy aliases
alias ls='ls --color'
alias dir='dir --color'
alias vdir='vdir --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ccaout='gcc -O2 -fopenmp -Wall -o $1 $1.c && ./$1'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lc='ls -C'
alias l='ls -CF'
alias lh='ls -halt --color'
alias lh1='ls -halt --color | head -10'
alias lh2='ls -halt --color | head -20'
alias lh3='ls -halt --color | head -30'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias find-extfiles-uniq='for f in $(find . -type f);do echo $(basename $f);done | egrep "[.]" | sort -u'
#alias find-suid-bins='find / -type f -perm -2000 -o -perm -4000 -ls'
#alias find-files-uniq='for f in $(find . -type f);do echo $(basename $f);done | sort -u'
alias configure-help="./configure --help > configure-help.out 2>&1 && $PAGER configure-help.out"

#alias ren='renice'

#alias ssl2='openssl s_client -ssl2 -connect'
#alias ssl3='openssl s_client -ssl3 -connect'
#alias ssl='openssl s_client -quiet -connect'
#alias tls='openssl s_client -connect'
#alias tls1='openssl s_client -tls1 -connect'
#alias tls11='openssl s_client -tls1 -connect'
#alias tls1_1='openssl s_client -tls1_1 -connect'
#alias tls12='openssl s_client -tls1_2 -connect'
#alias tls1_2='openssl s_client -tls1_2 -connect'
#alias tls13='openssl s_client -tls13 -connect'
#alias tls1_3='openssl s_client -tls1_3 -connect'

alias s_client='openssl s_client -connect'

alias GIT="cd /home/decal/GIT/decal;cd $1"

alias gitall="githose clone $1"
alias gistall="gisthose clone $1"
alias gristall="gristhose clone $1"
#alias cloneall="githose clone $1"
#alias cloneallrepo="githose clone $1"
#alias cloneallrepos="githose clone $1"
#alias cloneallgist="gisthose clone $1"
#alias cloneallgists="gisthose clone $1"
#alias cloneallacct="gristhose clone $1"
#alias clonealluser="gristhose clone $1"
#alias cloneallusers="gristhose clone $*"

## TODO: make this a function that takes username as first arg and repo as second
## TODO: add this and any other related aliases that need to be made to githose repo

alias github="cd /home/decal/github;cd */$1"
#alias chm='chmod'
#alias cho='chown'
#alias chm0d='chmod 0'
#alias ch0wn='chown 0'
#alias ch00wn='chown 0:0'
alias mirror='wget -m -np --no-check-certificate'
#alias nicely='maxnice'
#alias nitro='maxnice'
shopt -s checkwinsize cmdhist complete_fullquote expand_aliases extglob extquote force_fignore globstar histappend histreedit interactive_comments lithist login_shell progcomp promptvars sourcepath
