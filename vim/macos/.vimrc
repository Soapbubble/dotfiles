" Set compatibility to Vim only, ignoring Vi compatibility issues
set nocompatible

" Enable syntax highlighting
syntax on

" Enable file type detection and plugin and indent settings
filetype plugin indent on

" Set encoding to UTF-8
set encoding=utf-8

" Use spaces instead of tabs and set tab width
set expandtab
set shiftwidth=2
set tabstop=2

" Show line numbers
set number

" Highlight current line
set cursorline

" Enable mouse support in all modes
set mouse=a

" Set backspace so it acts as it should act
set backspace=indent,eol,start

" Enable searching as you type, ignoring case
set incsearch
set ignorecase
set smartcase

" Enable line wrapping
set wrap

" Show command in the bottom bar
set showcmd

" Enable 24-bit RGB color support
set termguicolors

" Set the status bar
set laststatus=2

" Use system clipboard
set clipboard=unnamed

" Disable creating backup files
set nobackup
set nowritebackup
set noswapfile

" Set undo file to enable persistent undo
set undofile
set undodir=~/.vim/undodir

" Minimal UI enhancements
set ruler
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remaps
nnoremap # #zz
nnoremap * *zz
nnoremap n nzz
nnoremap N Nzz
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap Q <Esc>:q<CR>
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap <space> zz
vnoremap P "_dP
vnoremap p "_dp
