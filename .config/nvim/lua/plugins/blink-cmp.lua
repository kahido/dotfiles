return {
  'saghen/blink.cmp',
  dependencies = {
    "fang2hou/blink-copilot",
    "onsails/lspkind.nvim",
  },

  build = 'cargo build --release',
  -- version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'regular',
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },

      -- list = {
      --   selection = function(ctx)
      --     return ctx.mode == "cmdline" and "auto_insert" or "preselect"
      --   end,
      -- },

      menu = {
        border = "rounded",

        cmdline_position = function()
          if vim.g.ui_cmdline_pos ~= nil then
            local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
            return { pos[1] - 1, pos[2] }
          end
          local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
          return { vim.o.lines - height, 0 }
        end,

        draw = {
          columns = {
            { "kind_icon", "label", gap = 1 },
            { "kind" },
          },
          components = {
            kind_icon = {
              text = function(item)
                local kind = require("lspkind").symbol_map[item.kind] or ""
                return kind .. " "
              end,
              highlight = "CmpItemKind",
            },
            label = {
              text = function(item)
                return item.label
              end,
              highlight = "CmpItemAbbr",
            },
            kind = {
              text = function(item)
                return "[" .. item.kind .. "]"
              end,
              highlight = "CmpItemKind",
            },
          },
        },
      },
    },

    keymap = {
      preset = "default",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
    },

    -- [TODO] verify if needed and for what used
    -- cmdline = {
    --   enabled = true,
    -- },

    sources = {
      -- default = { 'lsp', 'snippets', 'buffer', 'copilot' },
      default = { 'lsp', 'buffer' },
      providers = {
        lsp = {
          min_keyword_length = 2, -- Number of characters to trigger porvider
          score_offset = 0, -- Boost/penalize the score of the items
        },
        buffer = {
          min_keyword_length = 2,
          max_items = 5,
        },
      },
    },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',

      -- Frecency tracks the most recently/frequently used items and boosts the score of the item
      -- Note, this does not apply when using the Lua implementation.
      frecency = {
        -- Whether to enable the frecency feature
        enabled = true,
        -- Location of the frecency database
        path = vim.fn.stdpath('state') .. '/blink/cmp/frecency.dat',
        -- UNSAFE!! When enabled, disables the lock and fsync when writing to the frecency database.
        -- This should only be used on unsupported platforms (e.g. alpine, termux)
        unsafe_no_lock = false,
      },

    }
  },
  opts_extend = { 'sources.default' }
}
