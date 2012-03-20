" Vim global plugin for open URL on current line in browser
" Last Change: 2011 Jun 15
" Maintainer: Edson César <edsono@gmail.org>
" License: This file is placed in the public domain.

if exists("g:loaded_openurl")
  finish
endif
let g:loaded_openurl = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:OpenBrowser()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ )]*")
  let line = escape (line, "#?&;|%")
  exec ':silent !open ' . "\"" . line . "\""
endfunction

nnoremap <Leader>ow :call <SID>OpenBrowser()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
