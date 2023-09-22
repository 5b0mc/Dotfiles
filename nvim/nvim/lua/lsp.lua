local home = os.getenv( "HOME" )

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
local servers = {"cssls", "html"}
local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities
    }
end

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

lspconfig.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup{}


