set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

syntax enable

set tabstop=4
set expandtab
"set noexpandtab

set number
set incsearch
set ignorecase
set autoindent
set showmode
set showcmd
set ruler
set hlsearch

"Force to re-enable since pathogen command needs to be run before the line. It's already done in system.
filetype off
filetype plugin indent on

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

