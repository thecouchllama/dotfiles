" Toggle List windows
function! GetBufferList() abort
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx) abort
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> <leader>we :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> <leader>wl :call ToggleList("Location List", 'l')<CR>

" Toggle relative line numbers
function! NumberToggle() abort
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

inoremap <F5> <C-o>:call NumberToggle()<cr>
nnoremap <F5> :call NumberToggle()<cr>


function! Git_diff_windows(vertsplit, auto)
    if a:vertsplit
        rightbelow vnew
    else
        rightbelow new
    endif
    silent! setlocal ft=diff previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile
    exe "normal :r!LANG=C git diff --cached \no\<esc>1GddO\<esc>"
    setlocal nomodifiable
    noremap <buffer> q :bw<cr>
    if a:auto
        redraw!
        wincmd p
        redraw!
    endif
endfunction

autocmd FileType gitcommit call Git_diff_windows(0, 1)
