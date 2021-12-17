-- map functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fc', '<cmd>Telescope quickfix<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fl', '<cmd>Telescope loclist<cr>')
map('n', '<leader>fr', '<cmd>lua require"telescope".extensions.repo.list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/", "/%.zinit/", "/%.tmux/", "/%.config/", ".fzf", "/%Library/", "/%Documents/"}}<cr>')
map('n', '<f1>', '<cmd>Telescope help_tags<cr>')

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
map('n', '<leader>b', '<cmd>BufferLinePick<cr>')

-- switch quickfix list
map('n', ']q', '<cmd>cnext<cr>')
map('n', '[q', '<cmd>cprevious<cr>')

-- other
map('n', "<leader>'", '<C-w>s')
map('n', '<leader>;', '<C-w>v')
map('n', '<leader>P', '"+P')
map('n', '<leader>x', '<cmd>close<cr>')
map('n', '<leader>d', '<cmd>bdelete!<cr>')
map('n', '<leader>p', '"+p')
map('n', '<leader>rv', '<cmd>source $MYVIMRC<cr>')
map('n', '<leader>wd', '<cmd>pclose<cr>')
map('n', 'ZZ', '<cmd>wqa!<cr>')
map('n', '<C-s>', '<cmd>w<cr>')
map('v', '<C-s>', '<Esc><cmd>w<cr>')
map('v', '<leader>y', '"+y')

-- fugitive
map('n', '<leader>gb', '<cmd>Git blame<cr>')
map('n', '<leader><leader>gb', '<cmd>Git blame<cr>')
map('n', '<leader><leader>gc', '<cmd>Git commit<cr>')
map('n', '<leader><leader>gd', '<cmd>Git diff<cr>')
map('n', '<leader><leader>ge', '<cmd>Gedit<cr>')
map('n', '<leader><leader>gl', '<cmd>Gclog<cr>')
map('n', '<leader><leader>gp', '<cmd>Gpush origin HEAD<cr>')
map('n', '<leader><leader>gr', '<cmd>Gread<cr>')
map('n', '<leader><leader>gs', '<cmd>Git<cr><c-w>')

-- git linker
map('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>')
map('n', '<leader>gB', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>')

-- ulttest
map('n', '<leader>ta',  '<cmd>Ultest<cr>')
map('n', '<leader>tc',  '<cmd>UltestClear<cr>')
map('n', '<leader>tl',  '<cmd>UltestLast<cr>')
map('n', '<leader>tn',  '<cmd>UltestNearest<cr>')
map('n', '<leader>to',  '<cmd>UltestOutput<cr>')
map('n', '<leader>ts',  '<cmd>UltestSummary!<cr>')
map('n', '<leader>tx',  '<cmd>UltestStop<cr>')
map('n', '[t',  '<cmd>:call ultest#positions#prev()<CR>')
map('n', ']t',  '<cmd>:call ultest#positions#next()<CR>')

-- glow
map('n', '<leader>m',  '<cmd>Glow<cr>')
map('n', '<C-w>z',  '<C-w>|<C-w>_')

-- other
map('n', '<F4>', '<cmd>noh<cr>')
map('i', '<F4>', '<C-o><cmd>noh<cr>')
map('n', '<F7>', '<cmd>set spell!<cr>')
map('i', '<F7>', '<C-o><cmd>set spell!<cr>')
map('n', '<F8>', '<cmd>set list!<cr>')
map('i', '<F8>', '<C-o><cmd>set list!<cr>')
map('n', '<F9>', '<cmd>lua require"toggle_cmp".toggle_completion()<cr>')
map('i', '<F9>', '<C-o><cmd>lua require"toggle_cmp".toggle_completion()<cr>')
