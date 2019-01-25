# ~/.bash_logout: executed by bash(1) when login shell exits.

function clr {
  [ "$SHLVL" -eq 0 ] && return 1

  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console && /usr/bin/clear_console -q || [ -x /usr/bin/clear ] && /usr/bin/clear || [ -x /usr/bin/reset ] && /usr/bin/reset || [ -x /usr/bin/tput ] && /usr/bin/tput reset || echo

  return 0
}

clr

# clear the screen to increase privacy
#[ "$SHLVL" -ge 1 ] && /usr/bin/clear_console && /usr/bin/clear_console -q

/bin/chmod 0600 ~/.bash_history

[ ! -d ~/history ] && /bin/mkdir -p ~/history

/bin/chmod 0700 ~/history

[ -f ~/.bash_history ] && /bin/mv ~/.bash_history ~/history/.bash_history.$$

/bin/chmod 0400 ~/history/.bash_history.$$

[ -f ~/.sh_history ] && /bin/mv ~/.sh_history ~/history/.sh_history.$$

/bin/chmod 0400 ~/history/.sh_history.$$

