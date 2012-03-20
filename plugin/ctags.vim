" Vim global plugin for ctags
" This plugin wrappes ctags funcionality in vim.
" Last Change: 2012 Mar 14
" Maintainer: Edson César <edsono@gmail.com>
" License:    This file is placed in the public domain.

if exists("g:loaded_ctags")
  finish
endif
let g:loaded_ctags = 1

let s:save_cpo = &cpo
set cpo&vim

function! Ctags()
  let ignore = system("ctags -R &")
  unlet ignore
endfunction"

function! CtagsUpdate()
  let ignore = system("ctags-update '" . expand('%') . "' &")
  unlet ignore
endfunction"

command! -nargs=0 Ctags       :call Ctags()
command! -nargs=0 CtagsUpdate :call CtagsUpdate()

let &cpo = s:save_cpo
unlet s:save_cpo
