require('go').setup()

vim.cmd "autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)"

-- Format on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

-- Import on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>gb', '<cmd>GoBuild<cr>')
map('n', '<leader>gc', '<cmd>lua require("go.comment").gen()<cr>')
map('n', '<leader>gd', '<cmd>GoDoc<cr>')
map('n', '<leader>gl', '<cmd>GoLint<cr>')
map('n', '<leader>gj', '<cmd>GoCoverage<cr>')
map('n', '<leader>gr', '<cmd>GoRename<cr>')
map('n', '<leader>gt', '<cmd>GoTest<cr>')
