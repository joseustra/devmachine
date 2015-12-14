call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
Plug 'wincent/ferret'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'cdmedia/itg_flat_vim'

call plug#end()

filetype plugin on
filetype plugin indent on
syntax on

let mapleader = ","

" Switch panes with ctrl + j|k|h|l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable Arrow keys in Escape mode

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
set nowrap
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set lazyredraw " Don't redraw screen when running macros.
set directory^=$HOME/.vimswp//
set cursorline
set clipboard=unnamed

set guifont=Hack:h12


" Use Silver Searcher instead of grep
set grepprg=ag

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Highlight search result
set hlsearch
map <Leader><Space> :nohlsearch<CR>

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Without --hidden, it never finds .travis.yml since it starts with a dot
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0


" Remove trailing whitespace on save for all files.
au BufWritePre *.* :%s/\s\+$//e

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" NERDTree
map <C-n> :NERDTreeToggle<CR>

"Neocomplete
let g:neocomplete#enable_at_startup = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" syntastic
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_aggregate_errors = 1

" clock for vim-airline
function! AirlineInit()
  let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()
