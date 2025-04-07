vim.keymap.set('i', 'lk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>a', 'ggVG', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>e', ':Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>u', "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>o', "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>i', "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>y', "<cmd>lua require('fzf-lua').quickfix()<CR>", { silent = true })

vim.keymap.set('n', '<space>z', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', '<C-w>j', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>k', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>l', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>;', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set("t", "j", "<Left>", { noremap = true, silent = true, buffer = true })
vim.keymap.set("t", "k", "<Down>", { noremap = true, silent = true, buffer = true })
vim.keymap.set("t", "l", "<Up>", { noremap = true, silent = true, buffer = true })
vim.keymap.set("t", ";", "<Right>", { noremap = true, silent = true, buffer = true })

vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

