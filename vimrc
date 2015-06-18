call plug#begin('~/.vim/plugged')


" Navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim' }

" Other Utilities
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-commentary'

" Colors
Plug 'tomasr/molokai'

call plug#end()

syntax on
filetype plugin indent on " load filetype plugins/indent settings

" General
set clipboard+=unnamed " share windows clipboard
set wildmenu " turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.log,*Godeps,*/tmp/*,*.so,*.swp,*.zip " ignore these list file extensions
set nobackup
set noswapfile
set nowritebackup

" Vim UI
set incsearch
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set ruler
set showmatch
set sidescrolloff=10 " Keep 5 lines at the size
set ignorecase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set hlsearch
set mouse=a

" moving among splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <leader>w opens a vertical split window and switches to it
nnoremap <leader>W <C-w>v<C-w>l
" <leader>s opens a horizontal split window and switches to it
nnoremap <leader>S <C-w>s<C-w>l
" <leader><Space> clear last search highlightin
map <Space> :noh<cr>

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

if exists('&relativenumber')
  set relativenumber
  augroup WindowRNU
    auto!
    auto BufWinEnter,WinEnter,FocusGained * setlocal relativenumber
    auto WinLeave,FocusLost               * setlocal number
  augroup END
endif

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

au Filetype go nnoremap <leader>r :GoRun %<CR>

let mapleader = ","

" colorscheme molokai

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything
set runtimepath+=$GOROOT/misc/vim

" neocomplete
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
