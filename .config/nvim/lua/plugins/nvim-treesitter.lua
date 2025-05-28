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
}
