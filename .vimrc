" Vim Config file
"        _           
" __   _(_)_ __ ___  
" \ \ / / | '_ ` _ \ 
"  \ V /| | | | | | |
"   \_/ |_|_| |_| |_|
"
" Author Shelby Hendrickx

" Plugins {{{
" Plugin manager: Vim-Plug
call plug#begin('$HOME/.vim/plugged')
Plug 'arcticicestudio/nord-vim'                             " theme
Plug 'https://github.com/vim-airline/vim-airline.git'       " bottom status bar
Plug 'https://github.com/tpope/vim-fugitive.git'            " git support for vim (also needed for git in status bar)
Plug 'preservim/nerdtree'                                   " file tree
Plug 'tomtom/tcomment_vim'                                  " comment line 
Plug 'junegunn/fzf', { 'do': './install --bin' }            " file search plugin (base)
Plug 'junegunn/fzf.vim'                                     " fzf extension for vim (vim extension)
Plug 'ryanoasis/vim-devicons'                               " file icons (e.g. in nerd tree)
Plug 'ctrlpvim/ctrlp.vim'                                   " show files and buffers above status bar when searching
call plug#end()
let g:airline_powerline_fonts = 1                           " enable powerline fonts in status bar
" }}}

" Colors {{{
colorscheme nord
highlight Comment cterm=italic
set termguicolors       " enable true 24bit color support
syntax enable           " enable syntax processing
" }}}

" Spaces & Tabs {{{
set autoindent          " automatically indent lines from prev
set expandtab           " tabs are spaces
set softtabstop=4       " number of spaces in tab when editing
set tabstop=4           " number of visual spaces per TAB
" }}}

" UI Config {{{
filetype indent on      " load filetype-specific indent files
set cursorline          " highlight current line
set number              " show line numbers
set relativenumber      " show relative line numbers by default
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{(){]
set wildmenu            " visual autocomplete menu for commands
" }}}

" Searching {{{
set hlsearch            " highlight search matches

" Movement {{{
" Map move to beginning of line to B
nnoremap B ^
" Map move to end of line to E
nnoremap E $
" map ^ to nothing
nnoremap ^ <nop>
" map $ to nothing
nnoremap $ <nop>
" map search files to ;
map ; :Files<CR>
" map toggle nerd tree to <ctrl+o>
map <C-o> :NERDTreeToggle<CR>

nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
" }}}

" NERDTree {{{
" Open NERDTree automatically if vim starts up on opening a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if only window left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

