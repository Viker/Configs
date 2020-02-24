set autoindent
set smartindent
set smarttab
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set relativenumber 

" Display stuff
set showcmd

set showmode

set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch


"Fold Settings 
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10


set exrc
set secure
set background=dark
colorscheme torte
set encoding=utf-8
filetype indent on
syntax enable

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

"Fast Scrolling
set ttyfast

" Keybindings 
let mapleader = " "
inoremap jj <Esc>
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>

" Move Lines around Keybind 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Custom Terminal Cursor Stuff 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
