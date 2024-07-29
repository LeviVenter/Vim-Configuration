"Vim Config File

set nocompatible

" enable syntax
syntax on

" enable line numbers
set number

" enable cursor line
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" enable smartcase search
set ignorecase
set smartcase

" Formatting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set textwidth=80
set autoindent

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" show the matching pairs of () {} []
set showmatch

" show invisible characters
set listchars=tab:›\ ,trail:·,extends:>,precedes:<,nbsp:␣,space:·
set list
set colorcolumn=80


" colorscheme config
set background=dark

" Key Mappings
let mapleader = " "

" Window Split
map <leader>h :split<Space>
map <leader>v :vsplit<Space>


" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Enable/Disable highlight search
nnoremap <leader>hi <cmd>set hlsearch!<cr>


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'

" Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Syntax Highlighter
Plug 'sheerun/vim-polyglot'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'name': 'dracula' }

call plug#end()

colorscheme dracula
