vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window Managing
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', {})
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {})
vim.keymap.set('n', 'se', '<C-w>=')
vim.keymap.set('n', 'sx', ':close<CR>')

-- Move window
-- vim.keymap.set('n', '<Space>', '<C-w>w', {})
vim.keymap.set('', 'sh', '<C-w>h', {})
vim.keymap.set('', 'sk', '<C-w>k', {})
vim.keymap.set('', 'sj', '<C-w>j', {})
vim.keymap.set('', 'sl', '<C-w>l', {})

-- Tab Managing
vim.keymap.set('n', 'to', ':tabnew<CR>') -- open new tab
vim.keymap.set('n', 'tx', ':tabclose<CR>') -- close new tab
vim.keymap.set('n', 'tn', ':tabn<CR>') -- go to next tab
vim.keymap.set('n', 'tp', ':tabp<CR>') -- go to previous tab

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Show Treesitter Highlight Group
vim.keymap.set('n', 'qq', ':TSHighlightCapturesUnderCursor<CR>', { silent = true })
-- Regenerate CTages
vim.keymap.set('n', '<C-w>t', ':!$HOME/.local/bin/ctags -R --languages=C++,C --fields=+niazS --extras=+q --kinds-c++=+pxZ --kinds-c=+px -f $HOME/workspace/sources/.ctags $HOME/workspace/sources/*<CR>', { silent = true })
-- Clang Format
vim.keymap.set('n', '<C-w>f', ':<C-u>ClangFormat<CR>', {})
vim.keymap.set('v', '<C-w>f', ':ClangFormat<CR>', {})
