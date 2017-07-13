syntax enable

set nocompatible					"Latest VIM settings/options

source ~/.vim/plugins.vim

"--------------------Visuals--------------------------"
colorscheme basic-dark

set number						"Activate line numbers
set hlsearch						"Activates search highlighting
set incsearch						"Activates incremental search
set backspace=indent,eol,start
set tabstop=8
set expandtab						"Use spaces instead of tabs
set softtabstop=4
set shiftwidth=4
set mouse=a

"--------------------Auto-Commands--------------------"
nmap <Leader><space> :nohlsearch<cr>			"Adds search highlight removal
nmap <Leader>ev :tabedit $MYVIMRC<cr>			"Opens .vimrc file in a buffer
nmap <Leader>1 :NERDTreeToggle<cr>

"--------------------CtrlP Configuration--------------"
nmap <C-E> :CtrlPMRUFiles<cr>
nmap <C-N> :CtrlPBufTag<cr>

"--------------------Split Bindings-------------------"
set splitright
set splitbelow

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"-------------NERDTree Configuration------------------"
let NERDTreeHijackNetrw=0

"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
