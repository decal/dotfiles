# ~/.bash_logout: executed by bash(1) when login shell exits.

# clear the screen to increase privacy
[ "$SHLVL" = 1 ] && /usr/bin/clear_console && /usr/bin/clear_console -q

/bin/chmod 0600 ~/.bash*

[ ! -d ~/history ] && /bin/mkdir ~/history

/bin/chmod 0700 ~/history

[ -f ~/.bash_history ] && /bin/mv ~/.bash_history ~/history/.bash_history.$$

/bin/chmod 0400 ~/history/.bash_history.*

[ -f ~/.sh_history ] && /bin/mv ~/.sh_history ~/history/.sh_history.$$

/bin/chmod 0400 ~/history/.sh_history.*

