" Vim global plugin for show highlight group under cursor
" Last Change: 2011 Jun 152011 Jun 15
" Maintainer: Edson César <edsono@gmail.org>
" License: This file is placed in the public domain.

if exists("g:loaded_higroup")
  finish
endif
let g:loaded_higroup = 1

let s:save_cpo = &cpo
set cpo&vim

function! StatusHighlightGroup()
  if !exists("*synstack") || !exists("b:HiGroupShow") || !b:HiGroupShow
    return ''
  endif
  let status = synIDattr(synID(line('.'),col('.'),1),'name')
  if !empty(status)
    let status = '[' . status . ']'
  endif
  return status
endfunction

function! s:ToggleHiGroupShow()
  if exists('b:HiGroupShow')
    let b:HiGroupShow = b:HiGroupShow ? 0 : 1
  else
    let b:HiGroupShow = 1
  endif
  if b:HiGroupShow
    echo "Showing syntax highlight group in this buffer..."
  else
    echo "Hiding syntax highlight group in this buffer..."
  endif
endfunction

nnoremap <silent> <Leader>h :call <SID>ToggleHiGroupShow()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
