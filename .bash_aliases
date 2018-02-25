# Terminal Commands
alias c=clear
alias q=exit
alias h=history
alias j='jobs -l'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias winsize=xwininfo

# Safety Commands
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'

# List Commands
alias ls='ls --color -C'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -a'
alias ks=ls

# Directory Creation Commands
alias mkdir='mkdir -pv'

# grep commands
alias grep='grep --color'

# chmod commands
alias chx='chmod +x'

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
alias ping='ping -c 5'
alias fping='ping -c 100 -s.2'

# Vim commands
alias vi=vim
alias svi='sudo vi'
alias svim='sudo vim'
alias sbash='sudo bash'
alias edit=vim

# PAGER commands
alias More=more
alias Less=less
alias Most=most

# Python commands
alias python3="python3.5 -OO"
alias python2="python -OO"

## TODO: write gith function so 'gith clone' works..
alias gith-clone="git clone --verbose --recurse-submodules --no-single-branch --progress -- \"https://github.com/${BASH_ARGV[1]}/${BASH_ARGV[2]}\""

alias start="/mnt/c/Windows/System32/cmd.exe /c START /MAX /NODE 0 /D 'C:\Users\decal\AppData\Local\lxss\home\decal' /I /ABOVENORMAL"
