

vim.keymap.set('n', '<Leader>e', ':Explore<CR>')

vim.keymap.set('n', '<Leader>b', 
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>o', 
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>g', 
  "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })

vim.keymap.set('n', '<Leader>w', ':w!<CR>')
vim.keymap.set('n', '<Leader>d', ':bd<CR>')
vim.keymap.set('x', '<Leader>p', '\"_dP')
vim.keymap.set('i', 'kj', '<ESC>')
