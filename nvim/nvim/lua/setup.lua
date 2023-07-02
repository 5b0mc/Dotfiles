local telescope = require('telescope')
telescope.setup {
    pickers = {
        find_files = {
            find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
            sort_mru = true
        },
        buffers = {
            sort_lastused = true,
            sort_mru = true
        }
    }
}
telescope.load_extension('fzf')

require('lualine').setup{
    options = {
        theme = 'gruvbox-material',
        icons_enabled = false
    }
}

-- require("nvim-tree").setup()

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
    }
}

