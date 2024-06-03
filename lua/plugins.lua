
return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

-- LSP and completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'ray-x/cmp-treesitter'
    use 'onsails/lspkind-nvim'


    -- use {
    --     'glacambre/firenvim',
    --     run = function() vim.fn['firenvim#install'](0) end 
    -- }

-- other
    -- use 'khardix/vim-literate'          
    -- use 'p00f/godbolt.nvim'
    -- use 'preservim/tagbar'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
    }
    use 'psliwka/vim-smoothie'
    use 'fredins/papercolor-theme'
  -- use 'NLKNguyen/papercolor-theme'
    use 'protex/better-digraphs.nvim'
    use 'numToStr/Comment.nvim'
    -- use 'lervag/vimtex'


-- Language specific
    use 'neovimhaskell/haskell-vim'
    use 'alx741/vim-stylishask'
    use 'isovector/cornelis'
    use 'kana/vim-textobj-user'
    use 'neovimhaskell/nvim-hs.vim'
    use 'LnL7/vim-nix'
    -- use{
    --     'themaxmarchuk/tailwindcss-colors.nvim',
    --      module = 'tailwindcss-colors',
    --      config = function() return require('tailwindcss-colors').setup() end,
    -- }
    use 'BeneCollyridam/futhark-vim'

    end,

  config = {
    profile = {
      enable = true
    },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
}
)
