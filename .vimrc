" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set clipboard+=unnamedplus

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set cindent	" Use 'C' style program indenting

set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set tabstop=2	" Number of spaces per Tab
set mouse=a
syntax on

if !has('nvim')
	set ttymouse=xterm2
endif

"" Advanced
set cursorline
hi CursorLine cterm=NONE ctermbg=black
hi CursorLineNR cterm=NONE ctermbg=black

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set laststatus=2
set termencoding=utf-8
set encoding=utf-8

if (has('termguicolors'))
	set termguicolors
else
	set t_Co=256
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:ycm_key_list_stop_completion = [ '<C-y>', '<tab>' ]


" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"" Vim Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'pangloss/vim-javascript'
Plug 'ycm-core/YouCompleteMe'
Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'
call plug#end()

set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='icebergDark'
colorscheme iceberg
let g:airline_left_sep = ''
let g:airline_right_sep = ''
hi Comment gui=italic
hi Comment cterm=italic

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#show_tab_type = 0
