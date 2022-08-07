return require("packer").startup( function()
use 'wbthomason/packer.nvim'

use 'tpope/vim-commentary'
use 'tpope/vim-fugitive'
use 'junegunn/goyo.vim'
use 'ibhagwan/fzf-lua'

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use 'gruvbox-community/gruvbox'
end)
