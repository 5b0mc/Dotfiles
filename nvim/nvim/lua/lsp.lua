local home = os.getenv("HOME")
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>z', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gcc', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>w', function()
        if #vim.lsp.get_active_clients({ bufnr = 0 }) > 0 then
            vim.lsp.buf.format({ async = false })
        end
        vim.cmd("write")
    end, opts)

    client.server_capabilities.semanticTokensProvider = nil
end


-- npm i -g vscode-langservers-extracted
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.ocamllsp.setup {
    cmd = { home .. "/.opam/default/bin/ocamllsp" },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- npm install -g @vue/language-server
-- npm install -g @vue/typescript-plugin
-- npm install -g typescript-language-server typescript
local vue_language_server_path = home .. "/.npm-packages/lib/node_modules/@vue/typescript-plugin"
lspconfig.volar.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    hybridMode = false,

}
lspconfig.ts_ls.setup {
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
    single_file_support = false,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.denols.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup {
    cmd = { "gopls", "serve" },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod" },
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

-- npm install -g pyright
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
