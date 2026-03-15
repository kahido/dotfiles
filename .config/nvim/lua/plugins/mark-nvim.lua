return {
  'kahido/mark.nvim',
  lazy = false,
  config = function()
    require("mark").setup({
      DEBUG = false,
    })
  end
}
