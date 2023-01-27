call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
call plug#end()

syntax enable
colorscheme nord
set encoding=utf-8
set background=dark
set expandtab
set mouse=a
set autoindent
set number relativenumber
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set hidden
set nohlsearch
set cursorline
set incsearch
set shiftwidth=4
set softtabstop=4
set tabstop=4
set lbr

let mapleader=";"
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

nnoremap j gj
nnoremap k gk
inoremap kj <Esc>
map <leader>d :bd<cr>
map <leader>w :w<cr>
map <leader>e :NERDTreeFind<CR>
map <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
