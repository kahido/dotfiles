local map = vim.api.nvim_set_keymap

-- Split window
map('n', 'ss', ':split<Return><C-w>w', {})
map('n', 'sv', ':vsplit<Return><C-w>w', {})
-- Move window
map('n', '<Space>', '<C-w>w', {})
map('', 'sh', '<C-w>h', {})
map('', 'sk', '<C-w>k', {})
map('', 'sj', '<C-w>j', {})
map('', 'sl', '<C-w>l', {})
-- Resize window
map('n', '<C-w><left>', '<C-w><', {})
map('n', '<C-w><right>', '<C-w>>', {})
map('n', '<C-w><up>', '<C-w>+', {})
map('n', '<C-w><down>', '<C-w>-', {})
-- Show Treesitter Highlight Group
map('n', 'qq', ':TSHighlightCapturesUnderCursor<CR>', { silent = true })
