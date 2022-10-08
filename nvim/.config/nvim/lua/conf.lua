local cmp = require'cmp'
cmp.setup({
  snippet = {
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body)
	end,
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

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
	{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
  }, {
	  { name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
	{ name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
	{ name = 'path' }
  }, {
	  { name = 'cmdline' }
	})
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lualine').setup()
require'lspconfig'.pyright.setup { capabilities = capabilities }
require'lspconfig'.tsserver.setup {}
require'lspconfig'.vuels.setup{ capabilities = capabilities }
require'lspconfig'.emmet_ls.setup {
    capabilities = capabilities,
    filetypes = { "html", "css", "vue", "typescriptreact", "javascriptreact" },
}
require'nvim-treesitter.configs'.setup {
  indent = {
	enable = true
  },
  incremental_selection = {
	enable = true,
	keymaps = {
	  init_selection = "gnn",
	  node_incremental = "grn",
	  scope_incremental = "grc",
	  node_decremental = "grm",
	},
  },
  highlight = {
	enable = true,
	additional_vim_regex_highlighting = false,
  },
}
