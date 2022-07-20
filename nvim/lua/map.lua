-- map functions
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- hop
map("n", "<leader>s", "<cmd>HopWord<cr>")
map("n", "<leader>l", "<cmd>HopLine<cr>")
map("n", "<leader>/", "<cmd>HopPattern<cr>")

-- Resize iwndows
map("n", "<Left>", "<cmd>5winc <<cr>")
map("n", "<Right>", "<cmd>5winc ><cr>")

-- barbar
map("n", "<C-n>", "<cmd>BufferNext<cr>")
map("n", "<C-p>", "<cmd>BufferPrevious<cr>")
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
map("i", "<F4>", "<C-o><cmd>noh<cr>")
map("i", "<F7>", "<C-o><cmd>set spell!<cr>")
map("i", "<F8>", "<C-o><cmd>set list!<cr>")
map("i", "<F9>", '<C-o><cmd>lua require"toggle_cmp".toggle_completion()<cr>')
map("n", "<C-s>", "<cmd>w<cr>")
map("n", "<F2>", "<cmd>set wrap!<cr>")
map("n", "<F4>", "<cmd>noh<cr>")
map("n", "<F7>", "<cmd>set spell!<cr>")
map("n", "<F8>", "<cmd>set list!<cr>")
map("n", "<F9>", '<cmd>lua require"toggle_cmp".toggle_completion()<cr>')
map("n", "<leader>'", "<C-w>s")
map("n", "<leader>;", "<C-w>v")
map("n", "<leader>P", '"+P')
map("n", "<leader>d", "<cmd>bdelete!<cr>")
map("n", "<leader>p", '"+p')
map("n", "<leader>rv", "<cmd>source $MYVIMRC<cr>")
map("n", "ZZ", "<cmd>wqa!<cr>")
map("v", "<C-s>", "<Esc><cmd>w<cr>")


-- window movement
map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")

-- yank
map("v", "<leader>y", ":OSCYank<cr>")
map("n", "<leader>y", "<Plug>OSCYank", { noremap = false })

-- neotest
map("n", "[t", '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>')
map("n", "]t", '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>')

-- glow
map("n", "<leader>m", "<cmd>Glow<cr>")
map("n", "<C-w>z", "<C-w>|<C-w>_")

-- other

-- LSP
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>")
map("n", "<leader>c", "<cmd>Telescope lsp_code_actions<CR>")
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>")
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
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- dasht
map("n", "<leader><leader>K", ":Dasht!<Space>")
map("n", "<leader><leader>k", ":call Dasht(dasht#cursor_search_terms(), '!')<CR>")
map("n", "<leader>K", ":Dasht<Space>")
map("n", "<leader>k", ":call Dasht(dasht#cursor_search_terms())<CR>")
map("v", "<leader><leader>k", "y:<C-U>call Dasht(getreg(0), '!' )<CR>")
map("v", "<leader>k", "y:<C-U>call Dasht(getreg(0))<CR>")

-- Which Key Mappings
local wk = require("which-key")
wk.register({
  f = {
    name = "+Telescope",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diags" },
    f = { "<cmd>Telescope find_files<cr>", "FindFiles" },
    g = { "<cmd>Telescope git_files<cr>", "GitFiles" },
    h = { "<cmd>Telescope help_tags<cr>", "HelpTags" },
    i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "FindInBuffer" },
    j = { "<cmd>Telescope jumplist<cr>", "JumpList" },
    l = { "<cmd>Telescope loclist<cr>", "LocList" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    r = {
      '<cmd>lua require"telescope".extensions.repo.list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/", "/%.zinit/", "/%.tmux/", "/%.config/", ".fzf", "/%Library/", "/%Documents/"}}<cr>',
      "RepoList",
    },
  },
  g = {
    name = "+Git",
    b = { "<cmd>Git blame<cr>", "Blame" },
    h = {
      name = "+Github",
      c = {
        name = "+Commits",
        c = { "<cmd>GHCloseCommit<cr>", "Close" },
        e = { "<cmd>GHExpandCommit<cr>", "Expand" },
        o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
        p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
        z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
      },
      i = {
        name = "+Issues",
        p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
      },
      l = {
        name = "+Litee",
        t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
      },
      r = {
        name = "+Review",
        b = { "<cmd>GHStartReview<cr>", "Begin" },
        c = { "<cmd>GHCloseReview<cr>", "Close" },
        d = { "<cmd>GHDeleteReview<cr>", "Delete" },
        e = { "<cmd>GHExpandReview<cr>", "Expand" },
        s = { "<cmd>GHSubmitReview<cr>", "Submit" },
        z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
      },
      p = {
        name = "+Pull Request",
        c = { "<cmd>GHClosePR<cr>", "Close" },
        d = { "<cmd>GHPRDetails<cr>", "Details" },
        e = { "<cmd>GHExpandPR<cr>", "Expand" },
        o = { "<cmd>GHOpenPR<cr>", "Open" },
        p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
        r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
        t = { "<cmd>GHOpenToPR<cr>", "Open To" },
        z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
      },
      t = {
        name = "+Threads",
        c = { "<cmd>GHCreateThread<cr>", "Create" },
        n = { "<cmd>GHNextThread<cr>", "Next" },
        t = { "<cmd>GHToggleThread<cr>", "Toggle" },
      },
    },
    l = {
      name = "+Linker",
      u = { '<cmd>lua require"gitlinker".get_repo_url()<cr>', "RepoUrl" },
      b = {
        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        "OpenLine",
      },
      r = {
        '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        "OpenRepo",
      },
      l = { "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>", "LineUrl" },
    },
  },
  t = {
    name = "+NeoTest",
    a = { '<cmd>lua require("neotest").run.attach()<CR>', "Attach" },
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "CurrentFile" },
    d = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', "DAP" },
    l = { '<cmd>lua require("neotest").run.run_last()<CR>', "Last" },
    n = { '<cmd>lua require("neotest").run.run()<CR>', "Run" },
    o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', "Output" },
    s = { '<cmd>lua require("neotest").summary.toggle()<CR>', "Summary" },
    x = { '<cmd>lua require("neotest").run.stop()<CR>', "Stop" },
  },
  w = {
    name = "+Window",
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    x = { "<cmd>close<cr>", "Close" }
  },
  x = {
    name = "+Trouble",
    c = { "<cmd>TroubleClose<cr>", "Close" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "DocDiag" },
    l = { "<cmd>Trouble loclist<cr>", "LocList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "WorkSpaceDiag" },
    x = { "<cmd>Trouble<cr>", "Trouble" },
  },
}, { prefix = "<leader>" })
