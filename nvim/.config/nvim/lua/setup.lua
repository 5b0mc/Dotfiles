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
require('telescope').load_extension('fzf')

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true, 
            hide_dotfiles = true,
            hide_gitignored = true,
        }
    }

})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>]', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>[', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require "lspconfig"
local servers = {"cssls", "tsserver", "html"}
local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities
    }
end
require'lspconfig'.tsserver.setup{
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.volar.setup{
    cmd = {'vue-language-server', '--stdio'},
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
            defaultTagNameCase = 'both',
            defaultAttrNameCase = 'kebabCase',
            getDocumentNameCasesRequest = false,
            getDocumentSelectionRequest = false,
        },
    },
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities
}

require('lualine').setup{
    options = {
        theme = 'gruvbox-material',
        icons_enabled = false
    }
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.gopls.setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
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
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

