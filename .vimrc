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

"" Vim Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'cocopon/iceberg.vim'
Plug 'catppuccin/nvim', {'nane': 'catppuccin'}
Plug 'pangloss/vim-javascript'
Plug 'ycm-core/YouCompleteMe'
Plug 'ap/vim-css-color'
Plug 'KabbAmine/vCoolor.vim'
call plug#end()

set background=dark
hi Normal guibg=NONE ctermbg=NONE
colorscheme catppuccin
hi Comment gui=italic
hi Comment cterm=italic

lua << END
local custom_cat = require'lualine.themes.catppuccin'
custom_cat.normal.b.bg = '#302D41'
custom_cat.insert.b.bg = '#302D41'
custom_cat.command.b.bg = '#302D41'
custom_cat.visual.b.bg = '#302D41'
custom_cat.normal.b.fg = '#B7B2F9'
custom_cat.normal.a.bg = '#B7B2F9'
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_cat,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },  
	tabline = {},
  extensions = {}
}
END
