# Options set during initial config
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '/sdf/arpa/ns/p/protojeff/.zshrc'

# Highlighted tab completion with colors
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} menu select

# Highlighted tab completion without colors
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit

# Prompt, obviously
PROMPT='%F{1}>>%f '
RPROMPT='%F{0}%B%1~%b%f'

# Aliases
alias ls='colorls -GF'
alias ll='colorls -lGF'
alias la='colorls -laGF'

# Key bindings PuTTY
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[5~" beginning-of-history
bindkey "^[[6~" end-of-history
bindkey "^[[3~" delete-char
bindkey "^[[2~" quoted-insert

# Key bindings urxvt
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Environment Variables
export EDITOR=/usr/pkg/bin/vim
export VISUAL=/usr/pkg/bin/vim
