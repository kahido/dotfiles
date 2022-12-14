local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin Manager
  ---- Colorscheme
  use 'rmehri01/onenord.nvim'
  use 'navarasu/onedark.nvim'
  use '~/colorscheme/cppcs'
  ---- End of Colorscheme
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-treesitter/playground'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/zen-mode.nvim'
  use 'rhysd/vim-clang-format'
end)
