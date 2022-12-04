return require("packer").startup( function()
use 'wbthomason/packer.nvim'

use 'tpope/vim-commentary'
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'
use 'ibhagwan/fzf-lua'

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use 'digitaltoad/vim-pug'

use 'gruvbox-community/gruvbox'
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
end)
