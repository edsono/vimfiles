" Vim compiler file for ruby test with stack
" Last Change: 2012 Mar 13
" Maintainer:  Edson César <edsono@gmail.com>
" License:     This file is placed in the public domain.

if exists("current_compiler")
  finish
endif
let current_compiler = "rubytest"

let s:save_cpo = &cpo
set cpo-=C

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=ruby\ -Ilib:test\ $*

CompilerSet errorformat=
  \%+WNoMethodError:%.%#,
  \%+WArgumentError:%.%#,
  \%+Wtest_%.%#,
  \%E\ %#%f:%l:%m,
  \%-G%.%#

let &cpo = s:save_cpo
