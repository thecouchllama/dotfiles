--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "cobalt2"

-- fix color scheme
vim.cmd([[
augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight SignColumn guibg=#193549
  autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
  autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
  autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
  autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
]])

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"


-- Hop
lvim.keys.normal_mode["<leader><leader>s"] = ':HopWord<cr>'
lvim.keys.normal_mode["<leader><leader>l"] = ':HopLine<cr>'
lvim.keys.normal_mode["<leader><leader>/"] = ':HopPattern<cr>'

-- Navigator
lvim.keys.normal_mode["<C-h>"] = ":lua require('Navigator').left()<CR>"
lvim.keys.normal_mode["<C-k>"] = ":lua require('Navigator').up()<CR>"
lvim.keys.normal_mode["<C-l>"] = ":lua require('Navigator').right()<CR>"
lvim.keys.normal_mode["<C-j>"] = ":lua require('Navigator').down()<CR>"


-- Bufferline
lvim.keys.normal_mode["<C-n>"] = ':BufferNext<cr>'
lvim.keys.normal_mode["<C-p>"] = ':BufferPrev<cr>'


-- Other
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>'"] = '<C-w>s'
lvim.keys.normal_mode["<leader>;"] = '<C-w>v'
lvim.keys.normal_mode["<leader>P"] = '"+P'
lvim.keys.normal_mode["<leader>p"] = '"+p'
lvim.keys.normal_mode["<leader>rv"] = ':source $MYVIMRC<cr>'
lvim.keys.normal_mode["ZZ"] = ':wqa!<cr>'
lvim.keys.normal_mode["<leader>y"] = '"+y'

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
lvim.plugins = {
  {
   "numToStr/Navigator.nvim",
    config = function()
        require('Navigator').setup()
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
