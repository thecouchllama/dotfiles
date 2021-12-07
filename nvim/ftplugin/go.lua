-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>gb', '<cmd>GoBuild<cr>')
map('n', '<leader>gc', '<cmd>GoCoverage<cr>')
map('n', '<leader>gd', '<cmd>GoDoc<cr>')
map('n', '<leader>gl', '<cmd>GoLint<cr>')
map('n', '<leader>gn', '<cmd>GoRename<cr>')
map('n', '<leader>gr', '<cmd>GoRun<cr>')
map('n', '<leader>gt', '<cmd>GoTest<cr>')
map('n', '<leader>gv', '<cmd>GoVet<cr>')
