local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
}

vim.api.nvim_set_keymap('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
