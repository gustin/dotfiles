autocmd BufWritePre *.* :%s/\s\+$//e

set nocompatible
set encoding=utf-8
set hidden

set nowrap
set backspace=indent,eol,start set number

set autoindent
set copyindent
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set showmatch
set smarttab
set ruler

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

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_auto_sameids = 1

" svelte
au! BufNewFile,BufRead *.svelte set ft=html

" set Vue syntax colors correctly
autocmd FileType vue syntax sync fromstart
" Kotlin coding conventions are 4 spaces
autocmd FileType kotlin setlocal shiftwidth=4 tabstop=4

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=blue

let g:netrw_liststyle = 3
let g:netrw_banner = 0
