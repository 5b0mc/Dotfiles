return require("packer").startup( function()
use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use 'tpope/vim-commentary'
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'

use 'digitaltoad/vim-pug'

use 'nvim-lualine/lualine.nvim'
use 'sainnhe/gruvbox-material'
vim.cmd("colorscheme gruvbox-material")

use {
  'nvim-telescope/telescope.nvim',
  requires = {
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      {'nvim-lua/plenary.nvim'}
  }
}

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    }
  }

end)
