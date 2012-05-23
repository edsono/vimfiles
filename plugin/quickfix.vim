" Vim global plugin for more efficient use of quickfix cycle
" Last Change: 2012 Mar 14
" Maintainer: Edson César <edsono@gmail.org>
" License: This file is placed in the public domain.

if exists("g:loaded_quickfix")
  finish
endif
let g:loaded_quickfix = 1

let s:save_cpo = &cpo
set cpo&vim

hi! RedBar ctermfg=white ctermbg=darkred guifg=white guibg=darkred
hi! BlueBar ctermfg=white ctermbg=darkblue guifg=white guibg=darkblue
hi! GreenBar ctermfg=white ctermbg=darkgreen guifg=white guibg=darkgreen

function! QfReset()
  hi! clear Search
  hi! link BlueBar Search
endfunction

function! QfMessage()
  if getqflist() == []
    redraw
    echohl GreenBar
    echomsg 'Successful! No errors found!'
    echohl None
  else
    hi! clear Search
    hi! link RedBar Search
  endif
endfunction

" Make/Ant/Rake
nnoremap <silent> <Leader>q :make! %<CR>
nnoremap <silent> <Leader>Q :execute 'silent make! %' \| execute ':redraw!' \| call QfMessage()<CR>

" Show Quickfix window on error
augroup quickfix
  autocmd!
  autocmd! QuickFixCmdPost * call QfReset()
  autocmd! QuickFixCmdPost make call QfMessage()
  autocmd! QuickFixCmdPost [^l]* nested cwindow
  autocmd! QuickFixCmdPost    l* nested lwindow
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
