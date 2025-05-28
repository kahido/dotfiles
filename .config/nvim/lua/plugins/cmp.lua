return {
  {
    'saghen/blink.cmp',
    version = '*',
    build = 'cargo build --release',
    enabled = true,
    dependencies = {
      "fang2hou/blink-copilot"
    },
    opts = function(_, opts)
      opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
        default = { "lsp", "snippets", "buffer", "copilot" },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            kind = "LSP",
            score_offset = 90,
          },
          buffer = {
            name = "buffer",
            enabled = true,
            max_items = 3,
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 2,
            score_offset = 95,
          },
          snippets = {
            name = "snippets",
            enabled = true,
            max_items = 15,
            min_keyword_length = 2,
            module = "blink.cmp.sources.snippets",
            score_offset = 85, -- the higher the number, the higher the priority
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      })

      opts.cmdline = {
        enabled = true,
      }

      opts.completion = {
        -- menu = {
        --   border = "single",
        -- },
        documentation = {
          auto_show = true,
          -- window = {
          --   border = "single",
          -- },
        },
      }

      opts.keymap = {
        preset = "default",
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        -- ["<Up>"] = { "select_prev", "fallback" },
        -- ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        -- ["<S-k>"] = { "scroll_documentation_up", "fallback" },
        -- ["<S-j>"] = { "scroll_documentation_down", "fallback" },

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
      }

      return opts
    end,
  }
}
