set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set clipboard+=unnamedplus
set number relativenumber
set nu rnu

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set cindent	" Use 'C' style program indenting

set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set tabstop=4	" Number of spaces per Tab
set mouse=a
syntax on

if !has('nvim')
	set ttymouse=xterm2
endif

"" Key mapping
" Bring search results to midscreen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
set scrolloff=5
" tabs
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tt :tabnew<Space>
nnoremap tc :tabclose<CR>

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
let g:ycm_key_list_stop_completion = [ '<C-y>', '<ENTER>' ]
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set background=dark
hi Normal guibg=NONE ctermbg=NONE
colorscheme rosepine 
hi Comment gui=italic
hi Comment cterm=italic

