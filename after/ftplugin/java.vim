" ----------------------------------------------------------------------------
"  Java Plugin Configuration
" ----------------------------------------------------------------------------

setlocal tabstop=4
setlocal cinoptions=j1e2

setlocal complete=.,b,t
setlocal tags=tags,~/.vim/tags/jdk16,~/.vim/tags/junit41

setlocal suffixesadd=.java
setlocal include=^#\s*import 
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal path=.,src/**,test/**

setlocal keywordprg=
map <buffer> <silent> K :exe ":!open 'http://www.google.com/search?q=".expand("<cword>")."+Java'"<CR>

setlocal makeprg=ant\ -emacs
set errorformat=\%-G%.%#build.xml:%.%#,
\%DTesting:\ %f,
\%-GTestcase%.%#,
\%-Gexpected%.%#,
\%f:%l:\ %#%m,
\C:%f:%l:\ %m,
\%Ecom.%m,
\%Eorg.%m,
\%Ejava.%m,
\%ECaused\ by:%m,
\%ERoot\ cause:%m,
\%Ejunit.%.%#:\ %m,
\%C%.%#(%f:%l),
\%-Z%^\ %#%$,
\%-C%.%#,
\%-G%.%#
