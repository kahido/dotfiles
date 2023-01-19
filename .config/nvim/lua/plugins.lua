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
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
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
  use '~/colorscheme/cppcs'

  -- file icons
  use 'kyazdani42/nvim-web-devicons'

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- programming tools
  use 'rhysd/vim-clang-format'

  use 'folke/zen-mode.nvim'
end)
