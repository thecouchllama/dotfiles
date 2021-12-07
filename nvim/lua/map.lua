-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- git
map('n', '<leader><leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>')

-- hop
map('n', '<leader>s', '<cmd>HopWord<cr>')
map('n', '<leader>l', '<cmd>HopLine<cr>')
map('n', '<leader>/', '<cmd>HopPattern<cr>')

-- navigator (tmux)
map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>")
map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>")
map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>")
map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>")

-- bufferline
map('n', '<C-n>', '<cmd>BufferLineCycleNext<cr>')
map('n', '<C-p>', '<cmd>BufferLineCyclePrev<cr>')

-- switch quickfix list
map('n', '<leader>n', '<cmd>cnext<cr>')
map('n', '<leader>p', '<cmd>cprevious<cr>')

-- other
map('n', "<leader>'", '<C-w>s')
map('n', '<leader>;', '<C-w>v')
map('n', '<leader>V', '"+P')
map('n', '<leader>c', '<cmd>close<cr>')
map('n', '<leader>d', '<cmd>bdelete!<cr>')
map('n', '<leader>v', '"+p')
map('n', '<leader>rv', '<cmd>source $MYVIMRC<cr>')
map('n', '<leader>wd', '<cmd>pclose<cr>')
map('n', 'ZZ', '<cmd>wqa!<cr>')
map('n', '<C-s>', '<cmd>w<cr>')
map('v', '<C-s>', '<Esc><cmd>w<cr>')
map('v', '<leader>y', '"+y')

-- fugitive
map('n', '<leader><leader>gb', '<cmd>Git blame<cr>')
map('n', '<leader><leader>gc', '<cmd>Git commit<cr>')
map('n', '<leader><leader>gd', '<cmd>Git diff<cr>')
map('n', '<leader><leader>ge', '<cmd>Gedit<cr>')
map('n', '<leader><leader>gl', '<cmd>Gclog<cr>')
map('n', '<leader><leader>gp', '<cmd>Gpush origin HEAD<cr>')
map('n', '<leader><leader>gr', '<cmd>Gread<cr>')
map('n', '<leader><leader>gs', '<cmd>Git<cr><c-w>')
