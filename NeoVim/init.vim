"====================================
call plug#begin()
"=====================================

"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'

Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ervandew/supertab'
Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && msbuild' }
Plug 'dimixar/deoplete-omnisharp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'radenling/vim-dispatch-neovim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'SirVer/ultisnips'

Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'hecal3/vim-leader-guide'

Plug 'dracula/vim'
Plug 'freeo/vim-kalisi'

"=====================================
call plug#end()
"=====================================

color kalisi
set background=dark
syntax enable

filetype indent on

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

set tabstop=4
set softtabstop=4
set shiftwidth=4
set termguicolors
set expandtab
set number
set showcmd

set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set wildmenu
set smartcase
set foldenable
set foldlevelstart=10
set foldnestmax=10
set exrc
set secure


set encoding=utf-8
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set completeopt+=noinsert 
set completeopt-=preview
set autoindent
set copyindent
set nowrap
set noerrorbells
set nu " Enable line numbers
set visualbell 
set ignorecase
set number relativenumber
set mouse=a
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'


"NERDTree Remajps
map <C-n> :NERDTreeToggle<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

let mapleader = " "
inoremap jj <Esc>
" fast save and close
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>

"Hack for CopyPaste from Windows
source $VIMRUNTIME/mswin.vim

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline_theme='kalisi'

let g:python3_host_prog='C:/Program Files (x86)/Python36-32/python.exe'
let g:python_host_prog='C:/Python27/python.exe'



"set runtime path+=C:/Users/Nasser/AppData/Local/nvim/plugged/deoplete.nvim

let g:OmniSharp_selector_ui = 'fzf'
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 1000
let g:deoplete#auto_complete_start_length = 1
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
autocmd CompleteDone * pclose!

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1


" {{{ OmniSharp
let g:Omnisharp_start_server = 1
let g:Omnisharp_stop_server  = 1
let g:OmniSharp_host="http://localhost:2000"
let g:OmniSharp_timeout = 1
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_want_snippet = 1
 
"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs Neomake

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap <leader>mb :wa!<cr>:OmniSharpBuildAsync<cr>
    autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>mt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>mr :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <leader>mc :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <leader>md :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <leader>mfi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>mft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>mfs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>mfu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>mfm :OmniSharpFindMembers<cr>
    autocmd FileType cs nnoremap <leader>mss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>msp :OmniSharpStopServer<cr>
    autocmd FileType cs nnoremap <leader>mxi  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>mxu :OmniSharpFixUsings<cr>

    let g:mmap = {'name': 'OmniSharp'}
    let g:mmap.b = ['OmniSharpBuildAsync', 'Build']
    let g:mmap.g = ['OmniSharpGotoDefinition', 'Go to definition']
    let g:mmap.t = ['OmniSharpTypeLookup', 'Lookup type']
    let g:mmap.r = ['OmniSharpRename', 'Rename']
    let g:mmap.c = ['OmniSharpCodeFormat', 'Code format']
    let g:mmap.d = ['OmniSharpDocumentation', 'Documentation']
    let g:mmap.f = {'name': 'Find'}
    let g:mmap.f.i = ['OmniSharpFindImplementations', 'Implementation']
    let g:mmap.f.t = ['OmniSharpFindType', 'Type']
    let g:mmap.f.s = ['OmniSharpFindSymbol', 'Symbol']
    let g:mmap.f.u = ['OmniSharpFindUsages', 'Usages']
    let g:mmap.f.m = ['OmniSharpFindMembers', 'Members']
    let g:mmap.s = {'name': 'Server'}
    let g:mmap.s.s = [':OmniSharpStartServer', 'Start']
    let g:mmap.s.p = [':OmniSharpStopServer', 'Stop']
    let g:mmap.x = {'name': 'Fix'}
    let g:mmap.x.i = [':OmniSharpFixIssue', 'Issue']
    let g:mmap.x.u = [':OmniSharpFixUsings', 'Usings']

    autocmd FileType cs let g:lmap['m'] = g:mmap

    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>


augroup END

" leader guide config
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions(' ', "g:lmap") 

