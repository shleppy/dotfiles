"" Neovim config
"                       _           
"                      (_)          
"  _ __   ___  _____   ___ _ __ ___  
" | '_ \ / _ \/ _ \ \ / / | '_   _ \ 
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"" Author Shelby Hendrickx

" ============== Plugins ============== 
call plug#begin(stdpath('data') . '/plugged')
	Plug 'Shougo/deoplete.nvim' 		    " deoplete auto completion
    Plug 'deoplete-plugins/deoplete-jedi'   " deoplete python completion
	Plug 'dracula/vim'          			" dracula color scheme 
	Plug 'ryanoasis/vim-devicons'	    	" file icons 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file search
    Plug 'junegunn/fzf.vim'                 " fuzzy file search in vim
	Plug 'vim-airline/vim-airline'		    " airline
    Plug 'vim-airline/vim-airline-themes'	" airline themes 
	Plug 'scrooloose/nerdtree'	        	" nerd tree
    Plug 'scrooloose/nerdcommenter'         " nerd commenting
	Plug 'tpope/vim-fugitive'		        " git wrapper
	Plug 'Xuyuanp/nerdtree-git-plugin'	    " git support in nerd tree
	Plug 'airblade/vim-gitgutter'	    	" git changes in line
	Plug 'lervag/vimtex'			        " latex support
	Plug 'jiangmiao/auto-pairs'	        	" auto pair brackets
	Plug 'dense-analysis/ale'		        " code linter
	Plug 'rhysd/vim-grammarous'	        	" grammar checking
call plug#end()

" ============== General Config ============== 
let mapleader = ";"			" remap leader key to ;
set spell                   " spell check
" default wildignore
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
" latex wildignore
set wildignore+=*.aux,*.bbl,*.bcf,*.blg,*.fls,*.lof,*.lot
set undofile                " store undo across sessions 
set noswapfile              " disable creating swap file
set nobackup                " disable saving backups
set nowritebackup           " disable writing backups
" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" ============== Custom Shortcuts ============== 
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
" map leader + rc to open vim config file
nnoremap <Leader>rc :e $MYVIMRC<cr>
" switching buffers
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>l :buffers list<CR>

" ============== Colors ==============
" Color scheme 
if (has("termguicolors"))
	set termguicolors
endif
colorscheme molokai

" ============== UI Config ==============
filetype indent on	    	" load filetype-specific indent files
set cursorline		    	" highlight current line
set mouse=a			        " enable mouse scrolling
set title 			        " set window's title to current file
set number relativenumber 	" hybrid numbering
set foldmethod=syntax       " when folding enable use syntax       
set colorcolumn=80          " color wrap line number
set diffopt+=vertical       " always use vertical split for diffs
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" ============== Searching ==============
set smartcase               " use smartcase search when there is an uppercase
set ignorecase              " ignore case

" ============== Spaces & Tabs ==============
set expandtab			    " tabs are spaces
set shiftround              " round shifting to nearest multiple of shiftwidth
set shiftwidth=4	    	" when shifting use 4 spaces
set softtabstop=4	    	" number of spaces in tab when editing
set tabstop=4		    	" number of visual spaces per tab 

" ============== Movement ============== 
" Map move to beginning of line to B
nnoremap B ^
" Map move to end of line to E
nnoremap E $
" map ^ to nothing
nnoremap ^ <nop>  
" map $ to nothing
nnoremap $ <nop>
" use alt+hjkl to move between split/vsplit buffers
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" move line up and down with ctrl + j,k
nnoremap <C-J> :m+<cr>
nnoremap <C-k> :m-2<cr>

" ============== Text Rendering ============== 
set linebreak               " avoid wrapping lines in middle of words
set wrap                    " line wrapping
set smartindent             " smart indents

" ============== Neovim settings ============== 
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" remove line numbers from terminal
au TermOpen * setlocal nonumber norelativenumber
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" ============== Latex Config ==============
autocmd FileType tex set updatetime=2000 spell
autocmd FileType tex autocmd CursorHold,CursorHoldI * silent! wall
autocmd FileType tex command Compile !urxvt -cd %:p:h -e latexmk % &

" ============== Plugin Config ============== 
" Airline
let g:airline_theme='molokai'			    	" airline theme
let g:airline#extensions#tabline#enabled = 1	" display all buffers
let g:airline_powerline_fonts = 1		    	" enable powerline font

" Deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
let g:NERDTreeShowHidden = 1        " show hidden files 
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeRepectWildIgnore=1
" Open nerd tree on directories
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && 
    \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
    \ exe 'cd '.argv()[0] | endif
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
    \ b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-o> :NERDTreeToggle<CR>
" }}}
