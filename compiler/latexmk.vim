" Vim compiler file for tex using latexmk
" Last Change: 2012 Mar 27
" Maintainer:  Edson César <edsono@gmail.com>
" License:     This file is placed in the public domain.

if exists("current_compiler")
  finish
endif
let current_compiler = "latexmk"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=latexmk\ \-g\ $*

" Value errorformat are taken from vim help, see :help errorformat-LaTeX, with
" addition from Srinath Avadhanula <srinath@fastmail.fm>
CompilerSet errorformat=
CompilerSet errorformat=
  \%E!\ LaTeX\ %trror:\ %m,
  \%E!\ %m,
  \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
  \%+W%.%#\ at\ lines\ %l--%*\\d,
  \%WLaTeX\ %.%#Warning:\ %m,
  \%Cl.%l\ %m,
  \%+C\ \ %m.,
  \%+C%.%#-%.%#,
  \%+C%.%#[]%.%#,
  \%+C[]%.%#,
  \%+C%.%#%[{}\\]%.%#,
  \%+C<%.%#>%.%#,
  \%C\ \ %m,
  \%-GSee\ the\ LaTeX%m,
  \%-GType\ \ H\ <return>%m,
  \%-G\ ...%.%#,
  \%-G%.%#\ (C)\ %.%#,
  \%-G(see\ the\ transcript%.%#),
  \%-G\\s%#,
  \%+O(%*[^()])%r,
  \%+O%*[^()](%*[^()])%r,
  \%+P(%f%r,
  \%+P\ %\\=(%f%r,
  \%+P%*[^()](%f%r,
  \%+P[%\\d%[^()]%#(%f%r,
  \%+Q)%r,
  \%+Q%*[^()])%r,
  \%+Q[%\\d%*[^()])%r,
  \%-G%.%#

let &cpo = s:save_cpo
