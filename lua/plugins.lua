
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

    use 'junegunn/seoul256.vim'
    use 'shaunsingh/solarized.nvim'
    use 'shaunsingh/nord.nvim'
    use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
    }
    use 'neovimhaskell/haskell-vim'
    use 'p00f/godbolt.nvim'
    -- use 'norcalli/nvim-colorizer.lua'
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
      --  require('tailwindcss-colors').setup()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
}
)
