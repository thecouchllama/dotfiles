local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

-- Install packer if it doesn't already exist
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end

require("packer").startup(function()
	-- color theme
	use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Add git signs to git gutter
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use("tpope/vim-fugitive")

	-- markdown
	use("ellisonleao/glow.nvim")

	-- status bar
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("SmiteshP/nvim-gps")

	-- movement
	use({
		"phaazon/hop.nvim",
		as = "hop",
	})
	-- tree-sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Language Server
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("ray-x/lsp_signature.nvim")
	use("kosayoda/nvim-lightbulb")
	use("stevearc/dressing.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- languages
	use("buoto/gotests-vim")
	use("ray-x/go.nvim")
	use("towolf/vim-helm")

	-- dap
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("ray-x/guihua.lua")
	use("nvim-telescope/telescope-dap.nvim")

	-- tests
	use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

	-- fuzzy search
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("cljoly/telescope-repo.nvim")

	-- comment support
	use("b3nj5m1n/kommentary")

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	})
	use("rafamadriz/friendly-snippets")

	-- Utility
	use("AndrewRadev/splitjoin.vim")
	use("folke/lsp-colors.nvim")
	use("rhysd/conflict-marker.vim")
	use("sindrets/diffview.nvim")
	use("tpope/vim-unimpaired")
	use("windwp/nvim-autopairs")
	use("ojroques/vim-oscyank")
	use("sunaku/vim-dasht")
	use("j-hui/fidget.nvim")
end)

require("fidget").setup({
	text = {
		spinner = "dots",
	},
})
require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

-- cobalt 2
require("colorbuddy").colorscheme("cobalt2")

-- gitlinker
require("gitlinker").setup({
	mappings = "<space>gy",
})

require("gitsigns").setup({
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "▎",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	numhl = false,
	linehl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

		["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
		["n <leader>hS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
		["n <leader>hU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

		-- Text objects
		["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	},
	watch_gitdir = { interval = 1000 },
	sign_priority = 6,
	update_debounce = 200,
	status_formatter = nil, -- Use default
})

require("nvim-treesitter.configs").setup({
	on_config_done = nil,
	ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {},
	matchup = {
		enable = false, -- mandatory, false will disable the whole extension
		-- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = true,
		disable = { "latex" },
	},
	context_commentstring = {
		enable = false,
		config = { css = "// %s" },
	},
	autotag = { enable = false },
	incremental_selection = {
		enable = enable,
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "gnn", -- maps in normal mode to init the node/scope selection
			node_incremental = "grn", -- increment to the upper named parent
			scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
			node_decremental = "grm", -- decrement to the previous node
		},
	},
	textobjects = {
		-- syntax-aware textobjects
		enable = enable,
		lsp_interop = {
			enable = enable,
			peek_definition_code = {
				["DF"] = "@function.outer",
				["DF"] = "@class.outer",
			},
		},
		keymaps = {
			["iL"] = {
				-- you can define your own textobjects directly here
				go = "(function_definition) @function",
			},
			-- or you use the queries from supported languages with textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["aC"] = "@class.outer",
			["iC"] = "@class.inner",
			["ac"] = "@conditional.outer",
			["ic"] = "@conditional.inner",
			["ae"] = "@block.outer",
			["ie"] = "@block.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["is"] = "@statement.inner",
			["as"] = "@statement.outer",
			["ad"] = "@comment.outer",
			["am"] = "@call.outer",
			["im"] = "@call.inner",
		},
		move = {
			enable = enable,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = enable,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
					go = "(method_declaration) @function",
				},
			},
		},
		swap = {
			enable = enable,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	textsubjects = {
		enable = false,
		keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
	},
	playground = {
		enable = false,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	rainbow = {
		enable = false,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})

-- diffview
local cb = require("diffview.config").diffview_callback

require("diffview").setup({
	diff_binaries = false, -- Show diffs for binaries
	use_icons = true, -- Requires nvim-web-devicons
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	signs = {
		fold_closed = "",
		fold_open = "",
	},
	file_panel = {
		position = "left", -- One of 'left', 'right', 'top', 'bottom'
		width = 35, -- Only applies when position is 'left' or 'right'
		height = 10, -- Only applies when position is 'top' or 'bottom'
	},
	file_history_panel = {
		position = "bottom",
		width = 35,
		height = 16,
		log_options = {
			max_count = 256, -- Limit the number of commits
			follow = false, -- Follow renames (only for single file)
			all = false, -- Include all refs under 'refs/' including HEAD
			merges = false, -- List only merge commits
			no_merges = false, -- List no merge commits
			reverse = false, -- List commits in reverse order
		},
	},
	key_bindings = {
		disable_defaults = false, -- Disable the default key bindings
		-- The `view` bindings are active in the diff buffers, only when the current
		-- tabpage is a Diffview.
		view = {
			["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
			["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
			["gf"] = cb("goto_file"), -- Open the file in a new split in previous tabpage
			["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
			["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
			["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
			["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
		},
		file_panel = {
			["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
			["<down>"] = cb("next_entry"),
			["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
			["<up>"] = cb("prev_entry"),
			["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
			["o"] = cb("select_entry"),
			["<2-LeftMouse>"] = cb("select_entry"),
			["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
			["S"] = cb("stage_all"), -- Stage all entries.
			["U"] = cb("unstage_all"), -- Unstage all entries.
			["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
			["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
			["<tab>"] = cb("select_next_entry"),
			["<s-tab>"] = cb("select_prev_entry"),
			["gf"] = cb("goto_file"),
			["<C-w><C-f>"] = cb("goto_file_split"),
			["<C-w>gf"] = cb("goto_file_tab"),
			["<leader>e"] = cb("focus_files"),
			["<leader>b"] = cb("toggle_files"),
		},
		file_history_panel = {
			["g!"] = cb("options"), -- Open the option panel
			["<C-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
			["zR"] = cb("open_all_folds"),
			["zM"] = cb("close_all_folds"),
			["j"] = cb("next_entry"),
			["<down>"] = cb("next_entry"),
			["k"] = cb("prev_entry"),
			["<up>"] = cb("prev_entry"),
			["<cr>"] = cb("select_entry"),
			["o"] = cb("select_entry"),
			["<2-LeftMouse>"] = cb("select_entry"),
			["<tab>"] = cb("select_next_entry"),
			["<s-tab>"] = cb("select_prev_entry"),
			["gf"] = cb("goto_file"),
			["<C-w><C-f>"] = cb("goto_file_split"),
			["<C-w>gf"] = cb("goto_file_tab"),
			["<leader>e"] = cb("focus_files"),
			["<leader>b"] = cb("toggle_files"),
		},
		option_panel = {
			["<tab>"] = cb("select"),
			["q"] = cb("close"),
		},
	},
})

require("luasnip/loaders/from_vscode").lazy_load({
	paths = vim.fn.stdpath("config") .. "/snippets,~/.local/share/nvim/site/pack/packer/start/friendly-snippets",
})
local luasnip = require("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

local cmp = require("cmp")
cmp.setup({
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	completion = {
		get_trigger_characters = function(trigger_characters)
			return vim.tbl_filter(function(char)
				return char ~= " "
			end, trigger_characters)
		end,
		keyword_length = 2,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				luasnip = "(Snippet)",
				nvim_lsp = "(LSP)",
				path = "(Path)",
				buffer = "(Buffer)",
			})[entry.source.name]
			vim_item.dup = ({
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
			})[entry.source.name] or 0
			return vim_item
		end,
		duplicates_default = 0,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
			elseif cmp and cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
			elseif cmp and cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-n>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
			elseif cmp and cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-p>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
			elseif cmp and cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<Down>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
			elseif cmp and cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<Up>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
			elseif cmp and cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<CR>"] = cmp.mapping(function(fallback)
			cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
		end, {}),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "treesitter" },
		{ name = "buffer" },
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("repo")

local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"dockerls",
	"gopls",
	"lua",
	"pyright",
	"yamlls",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

local lsp_installer = require("nvim-lsp-installer")

local function on_attach(client, bufnr)
	-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local default_opts = {
		on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			-- Enable completion triggered by <c-x><c-o>
			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			local opts = { noremap = true, silent = true }

			vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			require("lsp_signature").on_attach({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				fix_pos = true,
				toggle_key = "<F2>",
				hi_parameter = "Search",
				handler_opts = {
					border = "rounded",
				},
			}, bufnr)
		end,
	}
	local server_opts = {
		["gopls"] = function()
			default_opts = {
				gopls = {
					settings = {
						gopls = { gofumpt = true },
					},
				},
			}
		end,
	}

	-- Use the server's custom settings, if they exist, otherwise default to the default options
	local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
	server:setup(server_options)
end)

-- telescope
vim.cmd("command! -bang Keymap Telescope keymaps")

-- null-ls
local null_ls = require("null-ls")
require("null-ls").setup({
	sources = {
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.diagnostics.ansiblelint,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.markdownlint.with({
			args = { "-c", "~/.markdownlint.yaml", "--stdin" },
		}),
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.prettier.with({
			disabled_filetypes = { "go" },
		}),
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.taplo,
		null_ls.builtins.formatting.trim_whitespace.with({
			disabled_filetypes = { "go" },
		}),
	},
})

vim.g.nullLsFormat = 1
vim.cmd("autocmd BufWritePre * if get(g:, 'nullLsFormat', 1) | exe 'lua vim.lsp.buf.formatting_seq_sync()' | endif")
vim.cmd("nnoremap <F6> :let g:nullLsFormat = !get(g:, 'nullLsFormat', 1)<cr>")

-- nvim-autopairs
require("nvim-autopairs").setup({})

-- trouble
require("trouble").setup({})
