" <<<  Vundle Plugin   >>> "
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  [[[ Plugin List ]]]  "
Plugin 'gmarik/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'rakr/vim-one'
Plugin 'scrooloose/nerdtree'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
"-----------------------"
call vundle#end()
filetype plugin indent on

syntax enable

set number 
set ignorecase
set smartcase
set hlsearch
set showmatch 
set noerrorbells
set novisualbell
set cursorline
set smarttab
set si "Smart indent
set wrap "Wrap lines
set ai "Auto indent

set history=500
set t_Co=256
set laststatus=2
set mouse=a
set shiftwidth=4
set tabstop=4
set background=dark
set encoding=utf8
set so=5 "j/k lines move
colorscheme onehalfdark
highlight Comment cterm=italic

let NERDTreeShowHidden=1

" :W sudo save
command W w !sudo tee % > /dev/null

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" AirLine Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'
let g:one_allow_italics = 1

" Enable true color
if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif
"Changes git
