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
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
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
    'nvim-treesitter/playground',
  }
}
