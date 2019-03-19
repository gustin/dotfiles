autocmd BufWritePre *.* :%s/\s\+$//e

set nocompatible
set encoding=utf-8
set hidden

set nowrap
set backspace=indent,eol,start
set number

set autoindent
set copyindent
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set showmatch
set smarttab

set ignorecase
set smartcase
set spell

set hlsearch
set incsearch

set history=1000
set undolevels=1000
set laststatus=2
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

set pastetoggle=<F12>

set background=dark
colorscheme Tomorrow-Night

call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ','
let g:Powerline_symbols = 'fancy'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:turbux_command_prefix = ''
let g:turbux_command_rspec  = 'be rspec'
let g:turbux_command_turnip = 'be rspec'
let g:dispatch_compilers = {'elixir': 'exunit'}

nnoremap <C-B> :ufExplorer<cr>
nnoremap ; :

:imap jk <Esc>

nmap <silent> ,/ :nohlsearch<CR>

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

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
