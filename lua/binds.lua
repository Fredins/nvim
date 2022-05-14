vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>lua require'telescope.builtin'.colorscheme{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require'telescope.builtin'.buffers{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lua require'telescope.builtin'.keymaps{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", { noremap = true })


