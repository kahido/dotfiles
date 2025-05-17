return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
        automatic_enable = true,
        ensure_installed = {
          "clangd", -- C/C++ language server not configured (install manualy)
          "cmake",
          "lua_ls",
          "bashls",
          "jsonls"
        },
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config['lua_ls'] = {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          }
        }
      }

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })
    end,
  },
}
