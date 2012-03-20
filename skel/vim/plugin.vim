" Vim global plugin for
" TODO explain purpose
" Last Change: $date
" Maintainer: Edson César <edsono@gmail.com>
" License:    This file is placed in the public domain.

if exists("g:loaded_$filename")
  finish
endif
let g:loaded_$filename = 1

let s:save_cpo = &cpo
set cpo&vim

" TODO Put your code here!

let &cpo = s:save_cpo
unlet s:save_cpo
