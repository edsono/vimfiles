" Vim global plugin for edit vim files
" These are commands shortcuts for edit vimrc, plugin, etc...
" Last Change: 2012 Mar 14
" Maintainer: Edson César <edsono@gmail.com>
" License:    This file is placed in the public domain.

if exists("g:loaded_eshortcut")
  finish
endif
let g:loaded_eshortcut = 1

let s:save_cpo = &cpo
set cpo&vim

" List vim files
function! s:ListVimFiles(arglead, cmdline, cursorpos)
  let result = []
  let tsearch = strpart(split(a:cmdline, ' ')[0], 1, 10) . '/**/' . a:arglead . '*'
  for fn in split(globpath(&rtp, tsearch), "\n")
    call insert(result, fnamemodify(fn, ':t:r'))
  endfor
  return result
endfunction

" Shortcuts to quickly edit configuration files
command! -nargs=0 Evimrc  :exec "tabnew ~/.vimrc"
command! -nargs=0 Egvimrc :exec "tabnew ~/.gvimrc"

command! -nargs=1 -complete=customlist,<SID>ListVimFiles Eplugin
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'plugin/<args>.vim'), "\n"), ' ')

command! -nargs=0 -complete=customlist,<SID>ListVimFiles Esnippets
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'snippets/' . &ft . '.snippets'), "\n"), ' ')

command! -nargs=? -complete=customlist,<SID>ListVimFiles Eindent
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'indent/' . (empty('<args>') ? &ft : '<args>') . '.vim'), "\n"), ' ')

command! -nargs=? -complete=customlist,<SID>ListVimFiles Eftplugin
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'ftplugin/' . (empty('<args>') ? &ft : '<args>') . '.vim'), "\n"), ' ')

command! -nargs=? -complete=customlist,<SID>ListVimFiles Esyntax
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'syntax/' . (empty('<args>') ? (exists('b:current_syntax') ? b:current_syntax : &ft) : '<args>') . '.vim'), "\n"), ' ')

command! -nargs=? -complete=customlist,<SID>ListVimFiles Ecompiler
  \ :exec ":tabnew \| args " . join(split(globpath(&rtp, 'compiler/' . (empty('<args>') ? (exists('b:current_compiler') ? b:current_compiler : &ft) : '<args>') . '.vim'), "\n"), ' ')

let &cpo = s:save_cpo
unlet s:save_cpo
