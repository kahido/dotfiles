return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        "cpp",
        "cmake",
        "json",
        "yaml",
        "lua",
        "comment",
        "gitignore"
      },
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = false,
        disable = {},
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({ "*" })
    end,
  },

  {
    dir = "~/colorscheme/maya-ko",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function()
      vim.cmd("colorscheme maya-ko")
    end,
  },

  {
    'MTDL9/vim-log-highlighting',
    lazy = true,
    ft = "log",
  },
}
