vim.opt.number 	       = true
vim.opt.relativenumber = true
vim.opt.incsearch      = true
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.smartindent    = false
vim.opt.cindent        = false
vim.opt.autoindent     = false
vim.opt.hlsearch       = false
vim.opt.swapfile       = false
vim.opt.wrap           = false
vim.opt.backup         = false 
vim.opt.clipboard:append('unnamedplus')
vim.opt.scrolloff      = 10
vim.opt.completeopt    = 'menu,menuone,noselect'
vim.opt.conceallevel   = 2
vim.opt.concealcursor  = 'nvic'
vim.opt.termguicolors  = true

vim.g.mapleader = " "
vim.g.maplocalleader = "ö"
vim.g.tex_flavor = "latex"

-- haskell
vim.g.haskell_enable_quantification   = 1  -- to enable highlighting of `forall`
vim.g.haskell_enable_recursivedo      = 1  -- to enable highlighting of `mdo` and `rec`
vim.g.haskell_enable_arrowsyntax      = 1  -- to enable highlighting of `proc`
vim.g.haskell_enable_pattern_synonyms = 1  -- to enable highlighting of `pattern`
vim.g.haskell_enable_typeroles        = 1  -- to enable highlighting of type roles
vim.g.haskell_enable_static_pointers  = 1  -- to enable highlighting of `static`
vim.g.haskell_backpack                = 1  -- to enable highlighting of backpack keywords
vim.g.haskell_classic_highlighting    = 0


-- colorscheme 
Colors = {
  GREY   = "#eeeeee",
  YELLOW = "#fdf6e3",
  WHITE  = "#ffffff",
}

local theme = 'light'
local backgroundColor = Colors.GREY

local colors = {
    color07                = {'#111111', '0'},
    color00                = {backgroundColor, ''},
    cursor_fg              = {backgroundColor, ''},
    cursorlinenr_bg        = {backgroundColor, ''},
    linenumber_bg          = {backgroundColor, ''},
    vertsplit_bg           = {backgroundColor, ''},
    todo_bg                = {backgroundColor, ''},
    visual_fg              = {backgroundColor, ''},
    visual_fg              = {backgroundColor, ''},
    tabline_inactive_fg    = {backgroundColor, ''},
    buftabline_active_fg   = {backgroundColor, ''},
    buftabline_inactive_fg = {backgroundColor, ''},
}

if theme == 'light' then 
  vim.g.PaperColor_Theme_Options = { 
    theme = {
      default = {
        transparent_background = 0,
        override = colors
      }
    }
  } 
end
vim.opt.background = theme
vim.cmd('colorscheme PaperColor')

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')



vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>TagbarToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require'telescope.builtin'.buffers{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lua require'telescope.builtin'.keymaps{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", { noremap = true })


-- diagraph
vim.api.nvim_set_keymap('i', '<C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('insert')<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', 'r<C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('normal')<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC><C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('visual')<CR>", { noremap = true })

-- agda
-- package.cpath = "/nix/store/cxn7v2ljwal7qw43r5y359jmyhz5f4w8-lua5.1-luautf8-0.1.4-1/lib/lua/5.1/lua-utf8.os" .. package.cpath
