"" Neovim config
""
"" Author Shelby Hendrickx

" Plugins
call plug#begin(stdpath('data') . '/plugged')
	Plug 'Shougo/deoplete.nvim' 		    " deoplete auto completion
	Plug 'dracula/vim'          			" dracula color scheme 
	Plug 'scrooloose/nerdtree'	        	" nerd tree
	Plug 'ryanoasis/vim-devicons'	    	" file icons 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file search
	Plug 'vim-airline/vim-airline'		    " airline
	Plug 'vim-airline/vim-airline-themes'	" airline themes 
	Plug 'tpope/vim-fugitive'		        " git wrapper
	Plug 'Xuyuanp/nerdtree-git-plugin'	    " git support in nerd tree
	Plug 'airblade/vim-gitgutter'	    	" git changes in line
	Plug 'lervag/vimtex'			        " latex support
	Plug 'jiangmiao/auto-pairs'	        	" auto pair brackets
	Plug 'dense-analysis/ale'		        " code linting
	Plug 'rhysd/vim-grammarous'	        	" grammar checking
call plug#end()

" Global settings {{{
let mapleader = ","			" remap leader key to ,
" }}} 

" Neovim settings {{{
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" }}}

" Colors {{{
" Color scheme 
if (has("termguicolors"))
	set termguicolors
endif
colorscheme dracula
" }}}

" UI Config {{{
filetype indent on	    	" load filetype-specific indent files
set cursorline		    	" highlight current line
set mouse=a			        " enable mouse scrolling
set title 			        " set window's title to current file
set number relativenumber 	" hybrid numbering
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" }}}

" Spaces & Tabs {{{
set expandtab			    " tabs are spaces
set shiftround              " round shifting to nearest multiple of shiftwidth
set shiftwidth=4	    	" when shifting use 4 spaces
set softtabstop=4	    	" number of spaces in tab when editing
set tabstop=4		    	" number of visual spaces per tab 
"" }}}

" Movement {{{
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
" }}}

" Text Rendering {{{
let display+=lastline       " always try to show paragraph's last line
set linebreak               " avoid wrapping lines in middle of words
set wrap                    " line wrapping
set smartindent             " smart indents
"}}}

" Plugin Configurations {{{

" Airline
let g:airline_theme='dracula'			    	" airline theme
let g:airline#extensions#tabline#enabled = 1	" display all buffers
let g:airline_powerline_fonts = 1		    	" enable powerline font


" Deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
let g:NERDTreeShowHidden = 1        " show hidden files 
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
" Open nerd tree on directories
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-o> :NERDTreeToggle<CR>
" }}}

