" Vim compiler file for Oracle SQL Plus
" Last Change: 2012 May 20
" Maintainer:  Edson César <edsono@gmail.com>
" License:     This file is placed in the public domain.

if exists("current_compiler")
  finish
endif
let current_compiler = "sqlplus"     " TODO validate compiler name!

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo&vim

CompilerSet makeprg=sqlplus\ -S\ -L\ /nolog\ @%

CompilerSet errorformat=
    \%E%l/%c%m,
    \%C%m,
    \%Z,
    \%-G%.%#

let &cpo = s:save_cpo
