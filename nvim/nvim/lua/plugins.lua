return require("packer").startup( function()
use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'

use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use 'tpope/vim-commentary'
use 'tpope/vim-fugitive'
use "ibhagwan/fzf-lua"

use 'cocopon/iceberg.vim'
use 'nvim-lualine/lualine.nvim'
vim.cmd("colorscheme iceberg")
end)
