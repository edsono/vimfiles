" Vim global plugin for strip trail whitespaces in file
" Last Change: 15/06/2011
" Maintainer: Edson César <edsono@gmail.org>
" License: This file is placed in the public domain.

function! s:StripTrailingWhitespaces()
  " Save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

map <silent> <Leader>x :call <SID>StripTrailingWhitespaces()<CR>
