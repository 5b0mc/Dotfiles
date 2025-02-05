return require("packer").startup(function()
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

    use 'shaunsingh/nord.nvim'
    use 'nvim-lualine/lualine.nvim'
    
    -- Avante.nvim configuration
    use {
        'yetone/avante.nvim',
        build = "make",
        lazy = false,
        version = false,
        BUILD_FROM_SOURCE = true,
        requires = {
            'nvim-tree/nvim-web-devicons',
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
                "echasnovski/mini.pick", -- for file_selector provider mini.pick

            {
                'MeanderingProgrammer/render-markdown.nvim',
                config = function()
                    require('render-markdown').setup({
                        file_types = { "markdown", "Avante" },
                    })
                end,
            },
        },
        config = function()
            require('avante.config')
        end,
        run = 'make', -- Optional, only if you want to use tiktoken_core to calculate tokens count
    }
end)
