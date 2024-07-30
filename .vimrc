"Vim Config Fil]e

set nocompatible

" enable syntax
syntax off

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
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:␣,space:·
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

" Status bar
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
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-scripts/AutoComplPop'

call plug#end()

" colorscheme config
set termguicolors
colorscheme catppuccin_mocha


" Status bar configuration -----------------------------------------------------
function! AirlineInitConfig()
	let g:airline_powerline_fonts = 1
	let g:airline_detect_modified = 1
	let g:airline_detect_spell = 1
	let g:airline_theme = 'catppuccin_mocha'

	" Extensions
	let g:airline_extensions = ['ale', 'branch', 'tabline']
	" ALE
	let airline#extensions#ale#error_symbol = 'E:'
	let airline#extensions#ale#warning_symbol = 'W:'
	let airline#extensions#ale#show_line_numbers = 1
	let airline#extensions#ale#open_lnum_symbol = '(L'
	let airline#extensions#ale#close_lnum_symbol = ')'
	" Branch
	let g:airline#extensions#branch#empty_message = 'No Commit'
	" Tabline
	let g:airline#extensions#tabline#formatter = 'unique_tail'

	" Symbols
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.colnr = ' ㏇:'
	let g:airline_symbols.colnr = ' ℅:'
	let g:airline_symbols.crypt = '🔒'
	let g:airline_symbols.linenr = '☰'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.spell = 'Ꞩ'
	let g:airline_symbols.notexists = 'Ɇ'
	let g:airline_symbols.notexists = '∄'
	let g:airline_symbols.whitespace = 'Ξ'

	" Sections
	let g:airline_section_a = airline#section#create(['mode','branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc','%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['Hex: %B'])
	let g:airline_section_z = airline#section#create_right(['l: %l','c: %c','%p%%'])

	let g:airline_filetype_overrides = {
				\ 'coc-explorer':  [ 'CoC Explorer', '' ],
				\ 'defx':  ['defx', '%{b:defx.paths[0]}'],
				\ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
				\ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
				\ 'gundo': [ 'Gundo', '' ],
				\ 'help':  [ 'Help', '%f' ],
				\ 'minibufexpl': [ 'MiniBufExplorer', '' ],
				\ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
				\ 'startify': [ 'startify', '' ],
				\ 'vim-plug': [ 'Plugins', '' ],
				\ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
				\ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
				\ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
				\ }

endfunction
autocmd User AirlineAfterInit call AirlineInitConfig()

