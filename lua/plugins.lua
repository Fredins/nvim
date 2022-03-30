
return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'jdhao/better-escape.vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
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
    use 'sainnhe/everforest'
    use 'shaunsingh/nord.nvim'
    use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
    }
    use 'neovimhaskell/haskell-vim'
    use 'p00f/godbolt.nvim'
    use{
        'themaxmarchuk/tailwindcss-colors.nvim',
         module = 'tailwindcss-colors',
         config = function() return require('tailwindcss-colors').setup() end,
    }
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
