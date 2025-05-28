return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = "make"
      -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      ";f",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = false
        })
      end,
      desc = "ists files in your current working directory, without hidden"
    },
    {
      ";g",
      function()
        local builtin = require("telescope.builtin")
        builtin.git_files()
      end,
      desc = "ists files in your current working directory, without hidden"
    },
    {
      "\\\\",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
      desc = "ists files in your current working directory, without hidden"
    },
    {
      ";t",
      function()
        local builtin = require("telescope.builtin")
        builtin.tags()
      end,
      desc = "ists files in your current working directory, without hidden"
    },
    {
      ";;",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "ists files in your current working directory, without hidden"
    },
    {
      "fb",
      function()
        local telescope = require("telescope")
        local function telescope_buffer_dir()
          return vim.fn.expand('%:p:h')
        end
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 }
        })
      end,
      desc = "ists files in your current working directory, without hidden"
    },
  },
  opts = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- your custom insert mode mappings
          ["n"] = {
            -- your custom normal mode mappings
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    }
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    return opts
  end
}
