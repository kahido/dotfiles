return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          -- "clangd", -- C/C++ language server not configured (install manualy)
          "cmake",
          "lua_ls",
          "bashls",
          "jsonls"
        },
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- local protocol = require("vim.lsp.protocol")

      local on_attach = function(_, _)
          -- format on save
          -- if client.server_capabilities.documentFormattingProvider then
          --     vim.api.nvim_create_autocmd("BufWritePre", {
          --         group = vim.api.nvim_create_augroup("Format", { clear = true }),
          --         buffer = bufnr,
          --         callback = function()
          --             vim.lsp.buf.format()
          --         end,
          --     })
          -- end

          -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          --   vim.lsp.diagnostic.on_publish_diagnostics, {
          --     virtual_text = true,
          --     signs = true,
          --     update_in_insert = false,
          --   }
          -- )
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server)
          nvim_lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- ["cmake"] = function()
        --   nvim_lsp["cmake"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --   })
        -- end,
        ["lua_ls"] = function()
          nvim_lsp["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = { -- custom settings for lua
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  -- make language server aware of runtime files
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
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
      })
    end,
  },
}
