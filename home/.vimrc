set nocompatible
set hidden

set nowrap
set backspace=indent,eol,start
set number

set autoindent
set copyindent
set tabstop=2
set shiftwidth=2
set shiftround
set showmatch
set smarttab

set ignorecase
set smartcase

set hlsearch
set incsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

set pastetoggle=<Leader>z

set background=dark
colorscheme Tomorrow-Night


call pathogen#infect()

syntax on
filetype plugin indent on


let mapleader = ','

nnoremap <C-B> :BufExplorer<cr>
nnoremap ; :

map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>
