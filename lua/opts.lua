vim.opt.number 	       = true
vim.opt.relativenumber = false
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
vim.opt.conceallevel   = 0
vim.opt.concealcursor  = 'nvic'
vim.opt.termguicolors  = true

vim.g.mapleader = " "
-- vim.g.maplocalleader = "^S"
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_general_vewer = 'okular'


-- haskell
vim.g.haskell_enable_quantification   = 0  -- to enable highlighting of `forall`
vim.g.haskell_enable_recursivedo      = 0  -- to enable highlighting of `mdo` and `rec`
vim.g.haskell_enable_arrowsyntax      = 0  -- to enable highlighting of `proc`
vim.g.haskell_enable_pattern_synonyms = 0  -- to enable highlighting of `pattern`
vim.g.haskell_enable_typeroles        = 0  -- to enable highlighting of type roles
vim.g.haskell_enable_static_pointers  = 0  -- to enable highlighting of `static`
vim.g.haskell_backpack                = 0  -- to enable highlighting of backpack keywords
vim.g.haskell_classic_highlighting    = 0
vim.g.haskell_ident_disable           = 1

vim.g.stylishask_on_save = 0

-- Cornelis
vim.g.cornelis_use_global_binary = 1
vim.g.cornelis_agda_prefix = "<c-l>"



vim.cmd([[
au BufRead,BufNewFile *.agda call AgdaFiletype()
function! AgdaFiletype()
    nnoremap <buffer> <leader>l :CornelisLoad<CR>
    nnoremap <buffer> <leader>r :CornelisRefine<CR>
    nnoremap <buffer> <leader>m :CornelisMakeCase<CR>
    nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
    nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
    nnoremap <buffer> <leader>n :CornelisSolve<CR>
    nnoremap <buffer> <leader>a :CornelisAuto<CR>
    nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
    nnoremap <buffer> <leader>k :CornelisPrevGoal<CR>
    nnoremap <buffer> <leader>j :CornelisNextGoal<CR>
    nnoremap <buffer> <C-A>     :CornelisInc<CR>
    nnoremap <buffer> <C-X>     :CornelisDec<CR>
    nnoremap <buffer> <leader>n :CornelisNormalize<CR>
endfunction

au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"
]])



-- colorscheme 
Colors = {
  GREY   = "#eeeeee",
  YELLOW = "#fdf6e3",
  WHITE  = "#ffffff",
}

local theme = 'light'
local backgroundColor = Colors.WHITE

local colors_light = {
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

local colors_dark = {
    color07                = {'#ffffff', '0'},
    color00                = {'#000000', ''},
    cursor_fg              = {'#000000', ''},
    cursorlinenr_bg        = {'#000000', ''},
    linenumber_bg          = {'#000000', ''},
    vertsplit_bg           = {'#000000', ''},
    todo_bg                = {'#000000', ''},
    visual_fg              = {'#000000', ''},
    visual_fg              = {'#000000', ''},
    tabline_inactive_fg    = {'#000000', ''},
    buftabline_active_fg   = {'#000000', ''},
    buftabline_inactive_fg = {'#000000', ''},
}


if theme == 'light' then 
  vim.g.PaperColor_Theme_Options = { 
    theme = {
      default = {
        transparent_background = 0,
        override = colors_light,
        allow_bold = 1
      }
    },
    language = {
      haskell = {
        no_bold_types = 1
      }
    }
  } 
end

if theme == 'dark' then 
  vim.g.PaperColor_Theme_Options = { 
    theme = {
      default = {
        transparent_background = 0,
        override = colors_dark,
        allow_bold = 1
      }
    },
    language = {
      haskell = {
        no_bold_types = 1
      }
    }
  } 
end


vim.opt.background = theme
vim.cmd('colorscheme PaperColor')

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')



vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>TagbarToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bu', "<cmd>lua require'telescope.builtin'.buffers{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>i', "<cmd>lua require'telescope.builtin'.keymaps{}<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>br', "<cmd>lua require'telescope.builtin'.git_branches{}<cr>", { noremap = true })


vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require'nabla'.popup()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pe', "<cmd>lua require'nabla'.enable_virt()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pd', "<cmd>lua require'nabla'.disable_virt()<cr>", { noremap = true })


-- diagraph
vim.api.nvim_set_keymap('i', '<C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('insert')<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', 'r<C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('normal')<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC><C-k><C-k>', "<Cmd>lua require'better-digraphs'.digraphs('visual')<CR>", { noremap = true })
vim.cmd([[
  dig v= 8659 
  dig l- 8866
  dig -l 8867
  dig >S 8407
  dig r> 8614
  dig r~ 10239
]]) 



vim.cmd([[
  execute "digraphs as " . 0x2090
  execute "digraphs es " . 0x2091
  execute "digraphs hs " . 0x2095
  execute "digraphs is " . 0x1D62
  execute "digraphs js " . 0x2C7C
  execute "digraphs ks " . 0x2096
  execute "digraphs ls " . 0x2097
  execute "digraphs ms " . 0x2098
  execute "digraphs ns " . 0x2099
  execute "digraphs os " . 0x2092
  execute "digraphs ps " . 0x209A
  execute "digraphs rs " . 0x1D63
  execute "digraphs ss " . 0x209B
  execute "digraphs ts " . 0x209C
  execute "digraphs us " . 0x1D64
  execute "digraphs vs " . 0x1D65
  execute "digraphs xs " . 0x2093
   
  execute "digraphs aS " . 0x1d43
  execute "digraphs bS " . 0x1d47
  execute "digraphs cS " . 0x1d9c
  execute "digraphs dS " . 0x1d48
  execute "digraphs eS " . 0x1d49
  execute "digraphs fS " . 0x1da0
  execute "digraphs gS " . 0x1d4d
  execute "digraphs hS " . 0x02b0
  execute "digraphs iS " . 0x2071
  execute "digraphs jS " . 0x02b2
  execute "digraphs kS " . 0x1d4f
  execute "digraphs lS " . 0x02e1
  execute "digraphs mS " . 0x1d50
  execute "digraphs nS " . 0x207f
  execute "digraphs oS " . 0x1d52
  execute "digraphs pS " . 0x1d56
  execute "digraphs rS " . 0x02b3
  execute "digraphs sS " . 0x02e2
  execute "digraphs tS " . 0x1d57
  execute "digraphs uS " . 0x1d58
  execute "digraphs vS " . 0x1d5b
  execute "digraphs wS " . 0x02b7
  execute "digraphs xS " . 0x02e3
  execute "digraphs yS " . 0x02b8
  execute "digraphs zS " . 0x1dbb
   
  execute "digraphs AS " . 0x1D2C
  execute "digraphs BS " . 0x1D2E
  execute "digraphs DS " . 0x1D30
  execute "digraphs ES " . 0x1D31
  execute "digraphs GS " . 0x1D33
  execute "digraphs HS " . 0x1D34
  execute "digraphs IS " . 0x1D35
  execute "digraphs JS " . 0x1D36
  execute "digraphs KS " . 0x1D37
  execute "digraphs LS " . 0x1D38
  execute "digraphs MS " . 0x1D39
  execute "digraphs NS " . 0x1D3A
  execute "digraphs OS " . 0x1D3C
  execute "digraphs PS " . 0x1D3E
  execute "digraphs RS " . 0x1D3F
  execute "digraphs TS " . 0x1D40
  execute "digraphs US " . 0x1D41
  execute "digraphs VS " . 0x2C7D
  execute "digraphs WS " . 0x1D42
  
  execute "digraphs /( " . 0x2209
  execute "digraphs co " . 0x0305
  execute "digraphs cl " . 0x0332
]])


-- agda
-- package.cpath = "/nix/store/cxn7v2ljwal7qw43r5y359jmyhz5f4w8-lua5.1-luautf8-0.1.4-1/lib/lua/5.1/lua-utf8.os" .. package.cpath
--
