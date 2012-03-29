" Vim global plugin for creating files from templates
" Last Change: 2011 Jun 15
" Maintainer: Edson César <edsono@gmail.com>
" License:    This file is placed in the public domain.

if exists("g:loaded_skel")
  finish
endif
let g:loaded_skel = 1

let s:save_cpo = &cpo
set cpo&vim

if has('unix')
  let s:SkelDir = '~/.vim/skel/'
else
  let s:SkelDir = '~/vimfiles/skel/'
endif

function! s:Skel(command, template, ...)
  if a:command == 'load'
    let fn = fnamemodify(bufname('%'), ':t:r')
  else
    if a:0 < 1
      echohl ErrorMsg
      echo 'Skel: ' . (a:command[0] == 'n' ? 'New' : 'N' . a:command[0]) . ' <template> <filename>'
      echohl None
      return
    endif
    let fn = !empty(fnamemodify(a:1, ":e")) ? a:1 : a:1 . "." . fnamemodify(a:template, ":e")
    exec tolower(a:command) . " " . fn
  endif
  exec "0r " . s:SkelDir . a:template
  if exists("*strftime")
    exec "%s/\$date/" . strftime("%Y %b %d") . "/g"
  endif
  exec "%s/\$filename/" . fnamemodify(fn, ":t:r") . "/g"
  if a:0 > 1
    for i in range(1, a:0 - 1)
      exec "%s/\$" . i ."/" . a:000[i] . "/g"
    endfor
  endif
endfunction

function! s:ListTemplates(arglead, cmdline, cursorpos)
  let result = []
  for fn in split(globpath(s:SkelDir, a:arglead . '**'), "\n")
    let tfile = fnamemodify(fn, ':~:s?' . escape(s:SkelDir, ' \.~') . '??')
    " Only returns files with extension!
    if tfile =~ '\.\w\+$'
      call insert(result, tfile)
    endif
  endfor
  return result
endfunction

command! -complete=customlist,<SID>ListTemplates -nargs=+ New call <SID>Skel("new", <f-args>)
command! -complete=customlist,<SID>ListTemplates -nargs=+ Ns call <SID>Skel("split", <f-args>)
command! -complete=customlist,<SID>ListTemplates -nargs=+ Nv call <SID>Skel("vsplit", <f-args>)
command! -complete=customlist,<SID>ListTemplates -nargs=+ Nt call <SID>Skel("tabnew", <f-args>)
command! -complete=customlist,<SID>ListTemplates -nargs=+ Lt call <SID>Skel("load", <f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
