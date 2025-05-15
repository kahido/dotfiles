return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = {
          "clangd", -- C/C++ language server not configured (install manualy)
          "cmake",
          "lua_ls",
          "bashls",
          "jsonls"
        },
        handlers = {
          lspconfig.lua_ls.setup({
            capabilities = lsp_capabilities,
          }),
        },
      })

     --  mason_lspconfig.setup_handlers({
     --    function(server)
     --      nvim_lsp[server].setup({
     --        capabilities = capabilities,
     --        on_attach = on_attach,
     --      })
     --    end,
        -- ["cmake"] = function()
        --   nvim_lsp["cmake"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --   })
        -- end,
        -- ["lua_ls"] = function()
        --   nvim_lsp["lua_ls"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     settings = { -- custom settings for lua
        --       Lua = {
        --         -- make the language server recognize "vim" global
        --         diagnostics = {
        --           globals = { "vim" },
        --         },
        --         workspace = {
        --           -- make language server aware of runtime files
        --           library = {
        --             [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --             [vim.fn.stdpath("config") .. "/lua"] = true,
        --           },
        --         },
        --       },
        --     },
        --   })
        -- end,
        -- ["bashls"] = function()
        --   nvim_lsp["bashls"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --   })
        -- end,
        -- ["jsonls"] = function()
        --   nvim_lsp["jsonls"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --   })
        -- end,
      -- })
    end,
  },
}
