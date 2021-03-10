"" runtime! archlinux.vim

"" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set clipboard=unnamedplus
 
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
set ttymouse=sgr
syntax on

"" Advanced
set ruler	" Show row and column ruler information
set guifont=CaskaydiaCove\ Nerd\ Font\ Regular:h8.5
command! -nargs=0 Sw w !sudo tee % > /dev/null

set cursorline
hi CursorLine cterm=NONE ctermbg=black
hi CursorLineNR cterm=NONE ctermbg=black


set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set laststatus=2
let g:powerline_pycmd="py3"
set termencoding=utf-8
set encoding=utf-8

  set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on  

colorscheme onedark
set background=dark
let g:airline_theme='onedark'
let g:one_allow_italics = 1
let g:airline_powerline_fonts = 1
  
