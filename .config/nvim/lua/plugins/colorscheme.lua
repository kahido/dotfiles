return {
  {
    dir = "~/colorscheme/maya-ko",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
    config = function()
      vim.cmd("colorscheme maya-ko")
    end,
  },
}
