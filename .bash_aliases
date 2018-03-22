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
alias ls1='ls -1'
alias ll='ls -l'
alias lsl='ls -l'
alias la='ls -a'
alias lsa='ls -a'
alias ks=ls
alias lsalt='ls -alt | less'

# Directory Creation Commands
alias mkdir='mkdir -pv' mkd='mkdir -pv'
alias mkdp='mkdir -p' mkdirp='mkdir -p'

# grep commands
alias grep='grep --color'

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
alias commit='git commit -a'
alias push='git push'

# Ping Commands
alias ping='ping -c 5' fping='ping -c 100 -s.2'

# Vim commands
alias vi=vim
alias svi='sudo vi'
alias svim='sudo vim'
alias bashp='bash --posix'
alias sbash='sudo bash'
alias sbashp='sudo bash --posix'
alias edit=vim
alias wget='wget --no-check-certificate'

# Python commands
alias python2='python2 -OO' python3='python3.5 -OO'

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
## TODO: write program that genenerates aliases bashed on char swaps
alias zpiinfo=zipinfo izpinfo=zipinfo 


alias ls='ls --color'
alias dir='dir --color'
alias vdir='vdir --color'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias ccc='gcc -O2 -fopenmp -Wall -pedantic $1'
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

alias configure-help="./configure --help > configure-help.out 2>&1 && $PAGER configure-help.out"

alias ren='renice'

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

alias github="cd /home/decal/github;cd */$1"
alias mirror='wget -m -np --no-check-certificate'

# Security Tools
alias xnmap="nmap -T5 -Pn -n -A -p0-65535 -sS $1 -oG $1.nmap"

# Package Management
alias update='apt-get -y update'
alias upgrade='apt-get -y upgrade'
alias autoremove='apt-get -y autoremove'

# Shell names
alias bsah='bash'
