local cmp = require'cmp'
cmp.setup({
  snippet = {
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body)
	end,
  },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
  mapping = {
	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	['<C-y>'] = cmp.config.disable,
	['<C-e>'] = cmp.mapping({
	  i = cmp.mapping.abort(),
	  c = cmp.mapping.close(),
	}),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
  }, {
	  { name = 'buffer' },
	})
})

cmp.setup.cmdline('/', {
  sources = {
	{ name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline' }})
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.gopls.setup { capabilities = capabilities }
require'lspconfig'.pyright.setup { capabilities = capabilities }
require'lspconfig'.tsserver.setup { capabilities = capabilities }
require'lspconfig'.vuels.setup{ capabilities = capabilities }
require'lspconfig'.emmet_ls.setup {
    capabilities = capabilities,
    filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
}

require'nvim-treesitter.configs'.setup {
  indent = { enable = true },
  highlight = {
	enable = true,
	additional_vim_regex_highlighting = false,
  }
}

require('lualine').setup()
