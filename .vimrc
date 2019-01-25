set autoindent cursorline title number wildmenu ruler expandtab smarttab showmatch shiftwidth=2 softtabstop=2 tabstop=2 backupdir=~/.backup encoding=utf-8 termencoding=utf-8 fileencoding=utf-8 filetype=c backup swapfile nowrap background=dark nu 
set magic hidden is aw showcmd visualbell ttyfast
set grepprg="egrep -n $* /dev/null"
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'vim-syntastic/syntastic'
"Plug 'gabrielelana/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()
