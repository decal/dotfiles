# ~/.bash_logout: executed by bash(1) when login shell exits.

# clear the screen to increase privacy
[ "$SHLVL" = 1 ] && /usr/bin/clear_console && /usr/bin/clear_console -q

mv ~/.bash_history ~/.bash_history.$$
chmod 0600 ~/.bash_history ~/.bash_history.*
