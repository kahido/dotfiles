return {
  'saghen/blink.cmp',
  dependencies = { "fang2hou/blink-copilot" },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
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

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = {
        auto_show = true,
      },
    },

    cmdline = {
      enabled = true,
    },

    sources = {
      default = { 'buffer' } -- { 'lsp', 'snippets', 'buffer', 'copilot' },
    }
  },
  opts_extend = {}
}
