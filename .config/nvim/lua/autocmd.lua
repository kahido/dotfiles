vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  pattern = {"*.lua", "*.{yaml,yml}", "CMakeLists.txt"},
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

vim.api.nvim_command("highlight ExtraWhitespace guibg=#d75f5f")

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*"},
  command = "match ExtraWhitespace /\\s\\+$/",
})

vim.api.nvim_create_autocmd({"InsertEnter"}, {
  pattern = {"*"},
  command = "match ExtraWhitespace /\\s\\+\\%#\\@<!$/",
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = {"*"},
  command = "match ExtraWhitespace /\\s\\+$/",
})

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*"},
  command = "call clearmatches()",
})
