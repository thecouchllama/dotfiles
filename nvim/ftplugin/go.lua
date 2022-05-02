require("go").setup({
	goimport = "gopls", -- if set to 'gopls' will use golsp format
	gofmt = "gopls", -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = "",
	comment_placeholder = "   ",
	lsp_cfg = true, -- false: use your own lspconfig
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = true, -- use on_attach from go.nvim
	filstruct = "gopls",
	dap_debug = true,
	dap_debug_gui = true,
})

local lsp_installer_servers = require("nvim-lsp-installer.servers")

local server_available, requested_server = lsp_installer_servers.get_server("gopls")
if server_available then
	requested_server:on_ready(function()
		local opts = require("go.lsp").config() -- config() return the go.nvim gopls setup
		requested_server:setup(opts)
	end)
	if not requested_server:is_installed() then
		-- Queue the server to be installed
		requested_server:install()
	end
end

-- map functions
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>b", "<cmd>GoBuild<cr>")
map("n", "<leader>ga", "<cmd>GoAlt<cr>")
map("n", "<leader>gcc", "<cmd>GoCmt<cr>")
map("n", "<leader>gct", "<cmd>GoCoverage<cr>")
map("n", "<leader>gd", "<cmd>GoDoc<cr>")
map("n", "<leader>gf", "<cmd>GoFillStruct<cr>")
map("n", "<leader>gs", "<cmd>GoAltS<cr>")
map("n", "<leader>gta", "<cmd>GoAddTag<cr>")
map("n", "<leader>gtc", "<cmd>GoClearTag<cr>")
map("n", "<leader>gtd", "<cmd>GoModeTidy<cr>")
map("n", "<leader>gte", "<cmd>GoAddExpTest<cr>")
map("n", "<leader>gtn", "<cmd>GoAddTest<cr>")
map("n", "<leader>gtr", "<cmd>GoRmTag<cr>")
map("n", "<leader>gv", "<cmd>GoAltV<cr>")
map("n", "<leader>ru", "<cmd>GoRun<cr>")
map("n", "<leader>tg", "<cmd>GoTest<cr>")

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
