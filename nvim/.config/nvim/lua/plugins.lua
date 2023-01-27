return require("packer").startup( function()
use 'wbthomason/packer.nvim'

use 'tpope/vim-commentary'
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'
use 'junegunn/fzf'
use 'junegunn/fzf.vim'

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use 'digitaltoad/vim-pug'

use 'nvim-lualine/lualine.nvim'
use 'sainnhe/gruvbox-material'

vim.cmd("colorscheme gruvbox-material")

end)
