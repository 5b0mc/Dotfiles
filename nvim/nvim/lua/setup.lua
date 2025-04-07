-- vim.cmd("colorscheme tokyonight")
vim.cmd("colorscheme nord")


local cmp = require('cmp')
cmp.setup({
  window = {
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-l>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

require("noice").setup({
messages = {
    enabled = false, -- Disabilita l'interfaccia dei messaggi di Noice
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = true,
      silent = true,
    },
    signature = {
      enabled = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
  views = {
    hover = {
      border = {
        style = "rounded",
      },
      win_options = {
        winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
      },
    },
  },
})


-- Highlight opzionali (ottimizzati per il tema Nord)
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2E3440", fg = "#ECEFF4" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#88C0D0", bg = "#2E3440" })

