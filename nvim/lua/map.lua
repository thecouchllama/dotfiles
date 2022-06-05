-- map functions
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fc", "<cmd>Telescope quickfix<cr>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fl", "<cmd>Telescope loclist<cr>")
map(
	"n",
	"<leader>fr",
	'<cmd>lua require"telescope".extensions.repo.list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/", "/%.zinit/", "/%.tmux/", "/%.config/", ".fzf", "/%Library/", "/%Documents/"}}<cr>'
)
map("n", "<f1>", "<cmd>Telescope help_tags<cr>")

-- hop
map("n", "<leader>s", "<cmd>HopWord<cr>")
map("n", "<leader>l", "<cmd>HopLine<cr>")
map("n", "<leader>/", "<cmd>HopPattern<cr>")

-- barbar
map("n", "<C-n>", "<cmd>BufferNext<cr>")
map("n", "<Right>", "<cmd>BufferNext<cr>")
map("n", "<C-p>", "<cmd>BufferPrevious<cr>")
map("n", "<Left>", "<cmd>BufferPrevious<cr>")
map("n", "<leader>a", "<cmd>BufferPick<cr>")
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>")

-- other
map("n", "<leader>'", "<C-w>s")
map("n", "<leader>;", "<C-w>v")
map("n", "<leader>P", '"+P')
map("n", "<leader>x", "<cmd>close<cr>")
map("n", "<leader>d", "<cmd>bdelete!<cr>")
map("n", "<leader>p", '"+p')
map("n", "<leader>rv", "<cmd>source $MYVIMRC<cr>")
map("n", "<leader>wd", "<cmd>pclose<cr>")
map("n", "ZZ", "<cmd>wqa!<cr>")
map("n", "<leader>F", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "<C-s>", "<cmd>w<cr>")
map("v", "<C-s>", "<Esc><cmd>w<cr>")

-- yank
map("v", "<leader>y", ":OSCYank<cr>")
map("n", "<leader>y", "<Plug>OSCYank", { noremap = false })

-- fugitive
map("n", "<leader>gb", "<cmd>Git blame<cr>")
map("n", "<leader><leader>gb", "<cmd>Git blame<cr>")
map("n", "<leader><leader>gc", "<cmd>Git commit<cr>")
map("n", "<leader><leader>gd", "<cmd>Git diff<cr>")
map("n", "<leader><leader>ge", "<cmd>Gedit<cr>")
map("n", "<leader><leader>gl", "<cmd>Gclog<cr>")
map("n", "<leader><leader>gp", "<cmd>Gpush origin HEAD<cr>")
map("n", "<leader><leader>gr", "<cmd>Gread<cr>")
map("n", "<leader><leader>gs", "<cmd>Git<cr><c-w>")

-- git linker
map("n", "<leader>gY", '<cmd>lua require"gitlinker".get_repo_url()<cr>')
map(
	"n",
	"<leader>gB",
	'<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>'
)

-- ulttest
map("n", "<leader>ta", "<cmd>Ultest<cr>")
map("n", "<leader>tc", "<cmd>UltestClear<cr>")
map("n", "<leader>tl", "<cmd>UltestLast<cr>")
map("n", "<leader>tn", "<cmd>UltestNearest<cr>")
map("n", "<leader>to", "<cmd>UltestOutput<cr>")
map("n", "<leader>ts", "<cmd>UltestSummary!<cr>")
map("n", "<leader>tx", "<cmd>UltestStop<cr>")
map("n", "[t", "<cmd>:call ultest#positions#prev()<CR>")
map("n", "]t", "<cmd>:call ultest#positions#next()<CR>")

-- glow
map("n", "<leader>m", "<cmd>Glow<cr>")
map("n", "<C-w>z", "<C-w>|<C-w>_")

-- other
map("n", "<F4>", "<cmd>noh<cr>")
map("i", "<F4>", "<C-o><cmd>noh<cr>")
map("n", "<F7>", "<cmd>set spell!<cr>")
map("i", "<F7>", "<C-o><cmd>set spell!<cr>")
map("n", "<F8>", "<cmd>set list!<cr>")
map("i", "<F8>", "<C-o><cmd>set list!<cr>")
map("n", "<F9>", '<cmd>lua require"toggle_cmp".toggle_completion()<cr>')
map("i", "<F9>", '<C-o><cmd>lua require"toggle_cmp".toggle_completion()<cr>')

-- LSP
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>")
map("n", "<leader>c", "<cmd>Telescope lsp_code_actions<CR>")
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>")

-- trouble
map("n", "<leader>xc", "<cmd>TroubleClose<cr>")
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<leader>xx", "<cmd>Trouble<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- dasht
map("n", "<leader><leader>K", ":Dasht!<Space>")
map("n", "<leader><leader>k", ":call Dasht(dasht#cursor_search_terms(), '!')<CR>")
map("n", "<leader>K", ":Dasht<Space>")
map("n", "<leader>k", ":call Dasht(dasht#cursor_search_terms())<CR>")
map("v", "<leader><leader>k", "y:<C-U>call Dasht(getreg(0), '!' )<CR>")
map("v", "<leader>k", "y:<C-U>call Dasht(getreg(0))<CR>")
