-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.cmd "command! -bang GoAlternateSplit call go#alternate#Switch(<bang>0, 'split')"
vim.cmd "command! -bang GoAlternateSplitV call go#alternate#Switch(<bang>0, 'vsplit')"


map('n', '<leader>b', '<cmd>GoBuild<cr>')
map('n', '<leader>ga', '<cmd>GoAlternate<cr>')
map('n', '<leader>gct', '<cmd>GoCoverageToggle<cr>')
map('n', '<leader>gca', '<cmd>GoCallers<cr>')
map('n', '<leader>gcs', '<cmd>GoCallstack<cr>')
map('n', '<leader>gd', '<cmd>GoDeclsDir<cr>')
map('n', '<leader>ge', '<cmd>GoWhicherrs<cr>')
map('n', '<leader>gf', '<cmd>GoDecls<cr>')
map('n', '<leader>ggt', '<cmd>GoTests<cr>')
map('n', '<leader>gga', '<cmd>GoTestsAll<cr>')
map('n', '<leader>gh', '<cmd>GoDescribe<cr>')
map('n', '<leader>gi', '<cmd>GoImplements<cr>')
map('n', '<leader>gl', '<cmd>GoMetaLinter<cr>')
map('n', '<leader>gp', '<cmd>GoChannelPeers<cr>')
map('n', '<leader>gr', '<cmd>GoReferrers<cr>')
map('n', '<leader>gs', '<cmd>GoAlternateSplit<cr>')
map('n', '<leader>gv', '<cmd>GoAlternateSplitV<cr>')
map('n', '<leader>ru', '<cmd>GoRun<cr>')
map('n', '<leader>t', '<cmd>GoTest<cr>')

vim.g.go_fmt_command = "goimports"

-- highlights
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
