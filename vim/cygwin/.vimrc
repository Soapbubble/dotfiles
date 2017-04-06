set shell=/bin/bash

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set nobackup		" do not keep a backup file
set backupdir=~/tmp " make sure to have this directory created first
                    " TODO: add code to check, create if not exists
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wildmenu   " enchanced tab completion while using commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Use utf8 encoding by default
set encoding=utf-8

" Don't use Ex mode, use Q for formatting
noremap Q <Esc>:q<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " For all text files, keep the textwidth setting, but disable the insertion of line breaks
  autocmd FileType text setlocal formatoptions-=t

  " For all text files set 'wrapmargin' to 0 characters so that wraping is disabled
  autocmd FileType text setlocal wrapmargin=0

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

colorscheme slate
set number
set expandtab
set tabstop=3
set shiftwidth=3
set incsearch
set hidden
set ignorecase
set laststatus=2 " Always show the status line (display the current mode, file name, file status, ruler, etc.)
set nobackup
set nowritebackup
set noswapfile
set title
set listchars=tab:>-,trail:_
set list
set wrap " wrap visually only (don't change the buffer)
set linebreak " wrap only at characters in breakat option -> don't break words
set nolist " list disables linebreak


nnoremap o o<Esc>
" map o <Esc>A<CR><Esc>
nnoremap O O<Esc>
" map O <Esc>I<CR><Esc>k
noremap <space> zz
nnoremap n nzz
nnoremap N Nzz
vnoremap p "_dp
vnoremap P "_dP
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Romanian diacritics
inoremap ks, <C-k>s,
inoremap kS, <C-k>S,
inoremap kt, <C-k>t,
inoremap kT, <C-k>T,
inoremap ka9 <C-k>a(
inoremap kA9 <C-k>A(
inoremap ka. <C-k>a>
inoremap kA. <C-k>A>
inoremap ki. <C-k>i>
inoremap kI. <C-k>I>


" buffers remaps
" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>
" Move to the next buffer with "gn"
nnoremap gn :bn<CR>
" List all possible buffers with "gl"
nnoremap gl :ls<CR>
" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b
" Display all buffers in the current window
nnoremap ga :ball<CR>

" auto reload of .vimrc when changes are made
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
