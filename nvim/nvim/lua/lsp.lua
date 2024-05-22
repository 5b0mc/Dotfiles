local home = os.getenv( "HOME" )

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>z', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    client.server_capabilities.semanticTokensProvider = nil 
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {"cssls", "html"}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities
    }
end

if vim.fn.executable("vls") == 1 then
    lspconfig.volar.setup{
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
        init_options = {
            typescript = {
            tsdk = home .. '/.npm-packages/lib/node_modules/typescript/lib'
            }
        },
        flags = lsp_flags,
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

lspconfig.rust_analyzer.setup {
    cmd = {"rustup", "run", "stable", "rust-analyzer"},
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
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

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach
}

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
