vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>TagbarToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require'telescope.builtin'.buffers{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lua require'telescope.builtin'.keymaps{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", { noremap = true })


