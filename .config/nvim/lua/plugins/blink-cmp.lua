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
      nerd_font_variant = 'mono',
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },

      list = {
        selection = {
          preselect = true,
          auto_insert= true,
        }
      },

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
          align_to = 'label',
          padding = 1,
          gap = 1,
          treesitter = {},
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 2 },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon = require("lspkind").symbol_map[ctx.kind] or ""
                return kind_icon .. ctx.icon_gap
              end,
              -- Set the highlight priority to 20000 to beat the cursorline's default priority of 10000
              highlight = function(ctx) return { { group = ctx.kind_hl, priority = 20000 } } end,
            },
            kind = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx) return ctx.kind end,
              highlight = function(ctx) return ctx.kind_hl end,
            },
            label = {
              width = { fill = true, max = 60 },
              text = function(ctx) return ctx.label .. ctx.label_detail end,
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                }
                if ctx.label_detail then
                  table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                end

                return highlights
              end,
            },
            label_description = {
              width = { max = 30 },
              text = function(ctx) return ctx.label_description end,
              highlight = 'BlinkCmpLabelDescription',
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
          module = 'blink.cmp.sources.lsp',
          min_keyword_length = 2, -- Number of characters to trigger porvider
          score_offset = -4, -- Boost/penalize the score of the items
          fallbacks = { 'buffer' }
        },
        buffer = {
          module = 'blink.cmp.sources.buffer',
          score_offset = -3,
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
