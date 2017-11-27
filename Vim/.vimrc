set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set exrc
set secure
syntax enable
set background=dark
colorscheme solarized
"autoloading pthogen
autocmd vimenter * NERDTree
execute pathogen#infect()
"NerdTree
nnoremap <F4> :NERDTreeToggle<CR>
set encoding=utf-8
