set autoindent cursorline title number wildmenu ruler expandtab smarttab showmatch shiftwidth=2 tabstop=2 backupdir=~/tmp termencoding=utf-8 fileencoding=utf-8 filetype=c backup swapfile nowrap background=dark nu 
set nohlsearch magic hidden is aw showcmd visualbell
set guifont=Monaco:h13
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'gabrielelana/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()
