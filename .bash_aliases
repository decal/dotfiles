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

# ASCII-enable all grep variants
alias grep='grep -a' egrep='egrep -a' fgrep='fgrep -a'
alias zgrep='zgrep -a' zegrep='zegrep -a' zfgrep='zfgrep -a'

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
alias add="git add $*" status='git status'
alias commit='git commit -a' push='git push'

# Ping Commands
alias ping='ping -c 5' fping='ping -c 100 -s.2'

# Vim commands
alias sv='sudo vi'
alias edit='vim'

# Bash commands
alias bp='bash --posix'
alias sb='sudo bash'

# Wget commands
alias wget='wget --continue --show-progress -U "MSIE" --no-check-certificate'
alias mirror='wget -m -np --no-check-certificate'

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
alias More=more omre=more mor=more
alias Less=less elss=less les=less
alias Most=most omst=most mos=most

## TODO: write program that genenerates aliases bashed on char swaps that can be: eval $(genswaps zipinfo)

# host
alias Host=host ohst=host hos=host

# list commands
alias ls='ls -C'
alias l1='ls -1' ls1='ls -1'
alias lsl='ls -l' lsa='ls -A'
alias lsd='ls -d' 
alias lsa1='ls -A1' ls1a='ls -1A'
alias lsld='ls -ld' lsdl='ls -dl'
alias slld='ls -ld' sldl='ls -dl'
alias lsal='ls -Al' lsla='ls -lA'
alias slal='ls -Al' slla='ls -lA'
# -@ Display extended attribute keys and sizes in long (-l) output.
alias lsl@='ls -l@' ls@l='ls -@l'
alias lsla@='ls -lA@' lsal@='ls -Al@' ls@al='ls -@al' lsa@l='ls -A@l' lsl@a='ls -l@A'
alias ks=ls
alias lsalt='ls -Alt'
alias lshalt='ls -hAlt' lsdalt='ls -dAlt'
alias lsdhalt='ls -lsdhAlt'
alias ll='ls -AlF'
alias la='ls -A'
alias lc='ls -C'
alias l='ls -CF'
alias lh='ls -hAlt'
alias lh1='ls -hAlt | head -10' lh2='ls -hAlt | head -20'
alias lh3='ls -hAlt | head -30' lh4='ls -hAlt | head -40'
alias lh5='ls -hAlt | head -50' lh6='ls -hAlt | head -60'
alias lh7='ls -hAlt | head -70' lh8='ls -hAlt | head -80'
alias lh9='ls -hAlt | head -90' lh10='ls -hAlt | head -100'

# Aliases related to the usage and/or free'ing of disk space
alias dusk='du -sk . | sort -n'
alias duhd1='du -hd1 .' duhd2='du -hd2 .'
alias duhd3='du -hd3 .' duhd4='du -hd4 .'
alias duhd5='du -hd5 .' duhd6='du -hd6 .'
alias duhd7='du -hd7 .' duhd8='du -hd8 .'
alias duhd9='du -hd9 .' duhd10='du -hd10 .'
alias duhd1g='du -hd1 . | egrep "(G|M)"' duhd2g='du -hd2 . | egrep "(G|M)"'
alias duhd3g='du -hd3 . | egrep "(G|M)"' duhd4g='du -hd4 . | egrep "(G|M)"'
alias duhd5g='du -hd5 . | egrep "(G|M)"' duhd6g='du -hd6 . | egrep "(G|M)"'
alias duhd7g='du -hd7 . | egrep "(G|M)"' duhd8g='du -hd8 . | egrep "(G|M)"'
alias duhd9g='du -hd9 . | egrep "(G|M)"' duhd10g='du -hd10 . | egrep "(G|M)"'

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
#alias tls11='openssl s_client -tls1_1 -connect'
#alias tls1_1='openssl s_client -tls1_1 -connect'
#alias tls12='openssl s_client -tls1_2 -connect'
#alias tls1_2='openssl s_client -tls1_2 -connect'
#alias tls13='openssl s_client -tls13 -connect'
#alias tls1_3='openssl s_client -tls1_3 -connect'

alias s_client='openssl s_client -connect'

alias GIT="cd /home/decal/GIT/decal;cd -- '$1'"

alias github="cd /home/decal/github;cd -- '*/$1'"

# Security Tools
alias xnmap="nmap -T5 -Pn -n -A -p0-65535 -sS '$1' -oG '$1.nmap'"

# Package Management
alias update='sudo apt-get -y update'
alias upgrade='sudo apt-get -y upgrade'
alias dist-upgrade='sudo apt-get -y dist-upgrade'
alias autoremove='sudo apt-get -y autoremove'
alias auto-update='update; upgrade; dist-upgrade; autoremove'
alias recent-installs='awk "$3~/^install$/ {print$4}" /var/log/dpkg.log | tail -n 22 | cut -d ":" -f1'

# Shell names
alias bsah=bash

# Utility Aliases
alias grepenv="egrep '^[A-Z0-9_]{3,12}$' | grep -v '^[a-z]{2,}$' | egrep -v '^[0-9]'"

