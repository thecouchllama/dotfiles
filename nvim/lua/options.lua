local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt -- to set options
local g = vim.g -- a table to access global variables

opt.rtp:append(vim.fn.stdpath("config") .. "/snippets") -- add snippet directory to rtp
opt.completeopt = { "menuone", "noinsert", "noselect" } -- Completion options (for deoplete)
opt.cmdheight = 2 -- Set the command height at the bottom to 2 lines
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable background buffers
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
opt.number = true -- Show line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.wildmode = { "list", "longest" } -- Command-line completion mode
opt.grepprg = "rg --vimgrep" -- Use rg for grep
opt.title = true -- Enable title
opt.wrap = true -- Use word wrapping
opt.linebreak = true -- Use line breaks
opt.spelllang = "en_us" -- Set spellcheck language
opt.autowrite = true
opt.autoindent = true
opt.showmatch = true
g.mapleader = " "

-- Set backup options
opt.backup = false
opt.writebackup = false
opt.backupdir = vim.fn.stdpath("config") .. "/.backup"

-- Undo settings
opt.undodir = vim.fn.stdpath("config") .. "/.undo"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000

-- Speed up nvim
opt.cursorline = false
g.matchparen_insert_timeout = 20
g.matchparen_timeout = 20

-- Setup folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Setup color
opt.colorcolumn = { 80, 120 }
vim.cmd("highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE")
