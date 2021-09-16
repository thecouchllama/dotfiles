"if exists('$TMUX')
"  augroup tmux
"    autocmd!
"    autocmd BufEnter,BufNewFile,BufReadPost,FileReadPost * call system("tmux rename-window " . expand("%:t"))
"    autocmd VimLeave * call system("tmux setw automatic-rename")
"  augroup end
"endif
"
"
"augroup DiffGit
"  autocmd!
"  autocmd FileType gitcommit if ! &previewwindow && expand('%:t') !~# 'index' | :DiffGitCached | wincmd k | :res -100 | :res +4 | endif
"augroup end
"
"augroup MyColors
"  autocmd!
"  autocmd ColorScheme * highlight SignColumn guibg=#193549
"  autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
"  autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
"  autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
"  autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
"augroup end
autocmd FileType gitcommit :DiffGitCached
