vim.cmd("colorscheme nord")

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-k>'] = cmp.mapping.select_next_item(),
        -- ['<C-l>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    })
})

require('lualine').setup {
    options = {
        theme = 'nord',
        icons_enabled = false
    }
}

require 'fzf-lua'.setup {
    buffers = {
        file_icons        = false,
    },
    files = {
        file_icons        = false,
    },
    keymap = {
        fzf = {
            -- ["ctrl-k"]     = "down",
            -- ["ctrl-l"]     = "up",
            ["ctrl-z"]     = "abort",
            ["ctrl-u"]     = "unix-line-discard",
            ["ctrl-f"]     = "half-page-down",
            ["ctrl-b"]     = "half-page-up",
            ["ctrl-a"]     = "beginning-of-line",
            ["ctrl-e"]     = "end-of-line",
            ["alt-a"]      = "toggle-all",
            ["f3"]         = "toggle-preview-wrap",
            ["f4"]         = "toggle-preview",
            ["shift-down"] = "preview-page-down",
            ["shift-up"]   = "preview-page-up",
        },
    },
}

require('oil').setup()
