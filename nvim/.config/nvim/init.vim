call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

Plug 'gruvbox-community/gruvbox'

call plug#end()

colorscheme gruvbox
set clipboard^=unnamed,unnamedplus

set cmdheight=2
set completeopt=menu,menuone,noselect
set cursorline
set hidden
set ignorecase
set mouse=a
set nobackup
set nohlsearch 
set noswapfile
set number
set relativenumber
set scrolloff=8
set shiftwidth=2
set signcolumn=yes
set softtabstop=2
set tabstop=2
set termguicolors
set expandtab
set textwidth=0
set linebreak
set wildignore+=*.pyc
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
let mapleader=";"

nnoremap j gj
nnoremap k gk
inoremap kj <Esc>
nmap <leader>d :bd<CR>
nmap <leader>n :bn<CR>
nmap<leader>w :w!<CR>
map <C-e> :NERDTreeToggle<CR>

nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

function! s:goyo_enter()
 lua require('cmp').setup.buffer { enabled = false }
endfunction

function! s:goyo_leave()
 lua require('cmp').setup.buffer { enabled = true }
endfunction

"source colemak.vim
lua require ('conf')
