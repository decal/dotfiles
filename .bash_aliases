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
[ `uname -s` == 'Darwin' ] && alias rm='rm -P' || alias rm='rm -I --preserve-root --one-file-system'
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

# Directory Creation Commands
alias mkdir='mkdir -pv' mkd='mkdir -pv'
alias mkdp='mkdir -p' mkdirp='mkdir -p'

# Process table commands
alias psx='COLUMNS=10240 ps axel'

# Lock Commands
alias reboot='sudo reboot 00' shutdown='sudo shutdown 00'

# Install commands
alias install='sudo apt install' fixdpkg='sudo dpkg --configure -a'

# Git Commands
alias add="git add $*"
alias commit='git commit -a' push='git push'

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
alias py=python py2=python2 py3=python3

# Crystal 
alias cr=crystal crb='crystal build' cre='crystal eval' crr='crystal run' 
alias crde='crystal deps' crdo='crystal docs' crd='crystal deps'

##TODO: write gith function so 'gith clone' works..
alias gith-clone="git clone --verbose --recurse-submodules --no-single-branch --progress -- \"https://github.com/${BASH_ARGV[1]}/${BASH_ARGV[2]}\""
alias start="/mnt/c/Windows/System32/cmd.exe /c START /MAX /NODE 0 /D 'C:\Users\decal\AppData\Local\lxss\home\decal' /I /ABOVENORMAL"

## Typos

# PAGER commands
alias More=more omre=more mroe=more moer=more
alias Less=less elss=less 
alias Most=most omst=most mots=most mtos=most

# host
alias Host=host ohst=host htos=host hots=host
## TODO: write program that genenerates aliases bashed on char swaps that can be: eval $(genswaps zipinfo)
alias zpiinfo=zipinfo izpinfo=zipinfo 

## TODO: make compile a function to strip the extension to -o argument
alias compile='gcc -O2 -fopenmp -Wall -pedantic $1'

# list commands
alias ls='ls -GC'
alias ls1='ls -1'
alias lsl='ls -l'
alias lsa='ls -a'
alias ks=ls
alias lsalt='ls -alt | less'
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
alias update='sudo apt-get -y update'
alias upgrade='sudo apt-get -y upgrade'
alias dist-upgrade='sudo apt-get -y dist-upgrade'
alias autoremove='sudo apt-get -y autoremove'
alias auto-update='update; upgrade; dist-upgrade; autoremove'
alias recent-installs='awk "$3~/^install$/ {print $4;}" /var/log/dpkg.log | tail -n 22 | cut -d ":" -f1'

# Shell names
alias bsah=bash

# Utility Aliases
alias grepenv="egrep '^[A-Z0-9_]{3,12}$' | grep -v '^[a-z]{2,}$' | egrep -v '^[0-9]'"

