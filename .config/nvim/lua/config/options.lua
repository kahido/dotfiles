vim.g.mapleader = " "

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.background = "dark"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.mouse = ""
vim.opt.signcolumn = "yes"

vim.opt.cursorline = true
vim.opt.colorcolumn = "90"

vim.opt.tags = { 'tags;' }
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Lists
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  extends = '>',
  precedes = '<',
  nbsp = '␣',
}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"

-- Workaround for treesitter flickering
vim.g._ts_force_sync_parsing = true
