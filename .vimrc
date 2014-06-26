
if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

NeoBundleLazy 'osyo-manga/vim-marching', {
            \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
            \ 'autoload' : {'filetypes' : ['c', 'cpp']}
            \ }

" My bundles
NeoBundle 'xoria256.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'int3/vim-taglist-plus'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'

NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'hallettj/jslint.vim'
NeoBundle 'toyamarinyon/vim-swift'

call neobundle#end()

filetype plugin indent on
syntax enable

NeoBundleCheck
 
autocmd BufNewFile,BufRead *.json set ft=javascript

set term=screen-256color
set background=dark
colorscheme xoria256
" hi Pmenu ctermbg=4

set ambiwidth=double
set autoread
set hidden
set number
set showmatch
set ttymouse=xterm2
set wildmode=list:longest,list:full

set directory-=.

"backup
set nobackup

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

"Tab
set expandtab
set smartindent
set ts=4 sw=4 sts=4

"search
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

set tags+=./tags

"statusline
set laststatus=2

" highligh cursor line
set cursorline
" cursor line only in active windows
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" CTRL-hjkl for window move
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"old settings
"set showmode
"set showcmd
"set ruler
"set hlsearch

" taglist settings
" The following line was needed for ctags installed by brew. Made symbolic
" link in /usr/bin instead and not needed. 
"let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function'
let Tlist_WinWidth='auto'
let Tlist_javascript_Hide_Extras=['type']

" tagbar settings to use jsctags
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
    \ }
nmap <F8> :TagbarToggle<CR>

"
" neocomplete.vim
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
" neocomplete.vim
"


"
" vim_marching.vim
"
let g:marching_backend = "sync_clang_command"

let g:marching_clang_command = "clang"

let g:marching_clang_command_option="-std=c++1y"

" let g:marching_include_paths = filter(
    " \   split(glob('/usr/include/c++/*'), '\n') +
    " \   split(glob('/usr/include/*/c++/*'), '\n') +
    " \   split(glob('/usr/include/*/'), '\n'),
    " \   'isdirectory(v:val)')
let g:marching_include_paths = [
            \ "/usr/include/c++/4.2.1/"
            \ ]

let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" set updatetime=200

" no insertion of completion word in omini completion
" imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" omin completion after clearing cache
" imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" code completion on sync
" let g:marching_backend = "sync_clang_command"
"
" vim_marching.vim
"


"
" neosnippet.vim
"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"
" neosnippet.vim
"


" Settings for Unite.vim
nnoremap    [unite]   <Nop>
nmap    f [unite]

" show buffer without splitting
nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" all in one
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" file list
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" buffer list
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" normal use
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" recent files
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" file list from the current directory of the current buffer
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>

" nerdcommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" nerdtree
nmap <F9> :NERDTreeToggle<CR>

