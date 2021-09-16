local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt  -- to set options
local g = vim.g      -- a table to access global variables

opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.grepprg = 'rg --vimgrep'        -- Use rg for grep
opt.title = true                    -- Enable title
opt.wrap = true                     -- Use word wrapping
opt.linebreak = true                -- Use line breaks
opt.spelllang = 'en'                -- Set spellcheck language
opt.autoindent = true
opt.showmatch = true
g.mapleader = ' '

-- Set backup options
opt.backup = false
opt.writebackup = false
opt.backupdir = vim.fn.stdpath('config') .. '/backup'

-- Undo settings
opt.undodir = vim.fn.stdpath('config') .. '/undo'
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000

-- Speed up nvim
opt.cursorline = false
g.matchparen_insert_timeout = 20
g.matchparen_timeout = 20

-- Setup folds
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false

-- Setup color
cmd 'colorscheme cobalt2'
opt.colorcolumn = {80, 120}

-- Fix highlights for gitsigns
cmd([[
augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight SignColumn guibg=#193549
  autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
  autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
  autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
  autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
]])

-- Setup tmux window renaming
cmd([[
if exists('$TMUX')
  augroup tmux
    autocmd!
    autocmd BufEnter,BufNewFile,BufReadPost,FileReadPost * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave * call system("tmux setw automatic-rename")
  augroup end
endif
]])
