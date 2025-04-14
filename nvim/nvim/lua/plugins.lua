return require("packer").startup(function()
    use "ibhagwan/fzf-lua"
    use "stevearc/oil.nvim"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'neovim/nvim-lspconfig'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
    use 'nvim-lualine/lualine.nvim'
end)
