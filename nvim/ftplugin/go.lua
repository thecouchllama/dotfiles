-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.go_fmt_command = "goimports"
map('n', '<leader>ga', '<cmd>GoAlternate<cr>')
map('n', '<leader>b', '<cmd>GoBuild<cr>')
map('n', '<leader>gc', '<cmd>GoCoverageToggle<cr>')
map('n', '<leader>gd', '<cmd>GoDecls<cr>')
map('n', '<leader>gh', '<cmd>GoDoc<cr>')
map('n', '<leader>gl', '<cmd>GoMetaLinter<cr>')
map('n', '<leader>gn', '<cmd>GoRename<cr>')
map('n', '<leader>gr', '<cmd>GoRun<cr>')
map('n', '<leader>t', '<cmd>GoTest<cr>')

vim.g.go_metalinter_autosave = 1 -- run metalinter on save

-- highlights
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1

-- Fix highlights for gitsigns
