vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  pattern = {"*.lua", "*.{yaml,yml}", "*.cmake", "CMakeLists.txt"},
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = {"*.log"},
--   command = "setlocal foldtext=foldtext()",
-- })

vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  pattern = {"*.{cpp,hpp,hxx,h}"},
  command = [[
    lua vim.diagnostic.enable(false)
  ]]
})

vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='LightRed' })
-- vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='#d75f5f' })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = [[
    syntax clear TrailingWhitespace |
    syntax match TrailingWhitespace "\_s\+$"
  ]]}
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
