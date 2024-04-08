vim.keymap.set('n', '<Leader>.', ':Explore<CR>')
vim.keymap.set('i', 'kj', '<ESC>')

vim.keymap.set('n', '<Leader>b', 
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>c', 
  "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>o', 
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>g', 
  "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })

vim.keymap.set('n', '<Leader>w', ':w!<CR>')
vim.keymap.set('n', '<Leader>d', ':bd<CR>')
vim.keymap.set('n', '<Leader>p', ':bp<CR>')

vim.keymap.set('v','j','h')
vim.keymap.set('v','k','j')
vim.keymap.set('v','l','k')
vim.keymap.set('v',';','l')

vim.keymap.set('n','j','h')
vim.keymap.set('n','k','j')
vim.keymap.set('n','l','k')
vim.keymap.set('n',';','l')
