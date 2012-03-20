" Vim compiler file for TODO
" Last Change: $date
" Maintainer:  Edson César <edsono@gmail.com>
" License:     This file is placed in the public domain.

if exists("current_compiler")
  finish
endif
let current_compiler = "$filename"     " TODO validate compiler name!

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo&vim

" TODO Put your makeprg
CompilerSet makeprg=makeprg\ -w\ $*

" TODO Put your error format here
CompilerSet errorformat=
    \%-G%.%#

let &cpo = s:save_cpo
