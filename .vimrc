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
Plug 'tomtom/tcomment_vim'                                  " comment line 
Plug 'junegunn/fzf', { 'do': './install --bin' }            " file search plugin (base)
Plug 'junegunn/fzf.vim'                                     " fzf extension for vim (vim extension)
Plug 'ctrlpvim/ctrlp.vim'                                   " show files and buffers above status bar when searching
Plug 'dart-lang/dart-vim-plugin'                            " dart syntax highlighting
Plug 'kaicataldo/material.vim'                              " material theme
Plug 'vim-airline/vim-airline-themes'                       " airline themes
Plug 'lervag/vimtex'                                        " latex support
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }      " latex live preview
Plug 'preservim/nerdtree'                                   " nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'                          " nerd tree git support
Plug 'ycm-core/youcompleteme'                               " autocompletion
Plug 'ryanoasis/vim-devicons'                               " icons, always load last
Plug 'jiangmiao/auto-pairs'                                 " auto pair brackets
Plug 'tpope/vim-surround'                                   " advanced surrounding text support
Plug 'dense-analysis/ale'                                   " code linting
Plug 'rhysd/vim-grammarous'                                 " grammar checking
Plug 'airblade/vim-gitgutter'                               " git changes in line 
call plug#end()
" }}}

" Global {{{
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.DS_Store,*.min.*,*.aux,*.fls,*.lof,*.lot,*.fdb_latexmk,*.bcf,*.blg,*.bbl,
set noswapfile          " disable swap files
set confirm             " display confirmation when closing unsaved file
noremap <Space> <Nop>   
let mapleader = "\<Space>"     " extra key combinations
set lazyredraw          " don't redraw while executing macros
" spelling
set spell spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
nnoremap <Leader>fs 1z=
" map leader + w to write 
nmap <leader>w :w!<cr>
" map leader copy paste to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" map leader + f to open fzf
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
" set semicolon to current line without moving cursor
nnoremap <Leader>; m'A;<ESC>`'
" quickly open vimrc
nnoremap <Leader>rc :e $MYVIMRC<CR>
" }}}

" Colors {{{
colorscheme molokai 
highlight Comment cterm=italic
if (has('termguicolors'))
  set termguicolors    " enable true 24bit color support
endif
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set background=dark
let g:rehash256 = 1     " attempt 256 color for theme
" }}}

" Spaces & Tabs {{{
set autoindent          " automatically indent lines from prev
set expandtab           " tabs are spaces
set shiftround          " round shifting to nearest multiple of shift width
set shiftwidth=4        " when shifting use 4 spaces
set smarttab            " insert tabstop number of spaces when pressing tab
set softtabstop=4       " number of spaces in tab when editing
set tabstop=4           " number of visual spaces per TAB
" }}}

" UI Config {{{
filetype indent on      " load filetype-specific indent files
set cursorline          " highlight current line
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{(){]
set wildmenu            " visual autocomplete menu for commands
set noerrorbells        " disable beep on errors
set mouse=a             " enable mouse for scrolling and resizing (also won't copy line numbers)
set title               " set window's title to current file
set foldcolumn=1        " extra margin on left
" set relative line number and line number depending on mode
set number relativenumber 
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" }}}
                       
" Text Rendering {{{
set display+=lastline   " always try to show paragraph's last line
set linebreak           " avoid wrapping line in middle of word
syntax enable           " enable syntax processing
set wrap                " enable line wrapping
set ai                  " auto indent
set si                  " smart indent
" }}}

" Searching {{{
set hlsearch            " highlight search matches
" }}}

" Movement {{{
" Map move to beginning of line to B
nnoremap B ^
" Map move to end of line to E
nnoremap E $
" map ^ to nothing
nnoremap ^ <nop>
" map $ to nothing
nnoremap $ <nop>
" Move line with alt + [jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" switching and closing buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  
" }}}

" Nerdtree {{{
" Open nerd tree on directories
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Auto close nerd tree if only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden by default
let NERDTreeShowHidden=1
" set wildignore
let NERDTreeRespectWildIgnore=1
" map toggle nerd tree to <ctrl+o>
map <C-o> :NERDTreeToggle<CR>
" toggle nerdtree with leader + t
nnoremap <leader>t :NERDTreeToggle<CR>
" }}}

" Airline {{{
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" YouCompleteMe {{{
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {
        \ 'tex' : ['{']
    \}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" }}}
