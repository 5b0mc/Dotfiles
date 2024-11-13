vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-j>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-;>', ':bn<CR>', { noremap = true })

vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>u',
    "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>c',
    "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>o',
    "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>g',
    "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>q',
    "<cmd>lua require('fzf-lua').quickfix()<CR>", { silent = true })

-- vim.keymap.set('v', 'j', 'h', { noremap = true, silent = true })
-- vim.keymap.set('v', 'k', 'j', { noremap = true, silent = true })
-- vim.keymap.set('v', 'l', 'k', { noremap = true, silent = true })
-- vim.keymap.set('v', ';', 'l', { noremap = true, silent = true })

-- vim.keymap.set('n', 'j', 'h', { noremap = true, silent = true })
-- vim.keymap.set('n', 'k', 'j', { noremap = true, silent = true })
-- vim.keymap.set('n', 'l', 'k', { noremap = true, silent = true })
-- vim.keymap.set('n', ';', 'l', { noremap = true, silent = true })

vim.keymap.set('n', '<C-w>j', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>k', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>l', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>;', '<C-w>l', { noremap = true, silent = true })

-- vim.keymap.set("t", "j", "<Left>", { noremap = true, silent = true, buffer = true })
-- vim.keymap.set("t", "k", "<Down>", { noremap = true, silent = true, buffer = true })
-- vim.keymap.set("t", "l", "<Up>", { noremap = true, silent = true, buffer = true })
-- vim.keymap.set("t", ";", "<Right>", { noremap = true, silent = true, buffer = true })
