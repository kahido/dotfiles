local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- fuzzy finding
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- color highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'norcalli/nvim-colorizer.lua'

  -- colorscheme
  use 'rmehri01/onenord.nvim'
  use '~/colorscheme/maya-ko'

  -- file icons
  use 'kyazdani42/nvim-web-devicons'

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- managing & installing lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'

  -- programming tools
  use 'rhysd/vim-clang-format'

  use 'folke/zen-mode.nvim'

  use {
    'phaazon/hop.nvim', branch = 'v2'
  }

  use 'embear/vim-foldsearch'

  use 'ThePrimeagen/vim-be-good'
end)
