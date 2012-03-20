" Vim global plugin for automatic folding
" xdoc comments are folded in level 1
" Last Change: 2011 Jun 15
" Maintainer: Edson César <edsono@gmail.org>
" License:    This file is placed in the public domain.

if exists("g:loaded_foldit")
  finish
endif
let g:loaded_foldit = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('s:Comment')
  let s:Comment = {}
endif

function! FoldItDefineComment(ft, inline, start, middle, end, empty)
  let s:Comment[a:ft] = {'Inline': '', 'Start': '', 'Middle': '', 'End': '', 'Empty': ''}
  let s:Comment[a:ft].Inline = a:inline
  let s:Comment[a:ft].Start = a:start
  let s:Comment[a:ft].End = a:end
  let s:Comment[a:ft].Middle = a:middle
  let s:Comment[a:ft].Empty = empty(a:empty) ? '\s*$' : '\(\s\|[' . a:empty . ']\)*$'
endfunction

function! FoldItExpr(lnum)
  let ft = empty(&ft) ? &ft : split(&ft, '\.')[0]
  if !has_key(s:Comment, ft)
    return 0
  endif

  let line = getline(a:lnum)
  if !empty(s:Comment[ft].Inline) && line =~ s:Comment[ft].Inline
    let _line = getline(a:lnum - 1) =~ s:Comment[ft].Inline
    let line_ = getline(a:lnum + 1) =~ s:Comment[ft].Inline
    if !_line && line_
      return '>1'
    elseif _line && !line_
      return '<1'
    else
      return '='
    endif
  elseif !empty(s:Comment[ft].Start) && line =~ s:Comment[ft].Start
    return '>1'
  elseif !empty(s:Comment[ft].End) && line =~ s:Comment[ft].End
    return '<1'
  else
    return '='
  endif
endfunction

function! FoldItText()
  let ft = empty(&ft) ? &ft : split(&ft, '\.')[0]
  if !has_key(s:Comment, ft)
    return foldtext()
  endif

  let line = getline(v:foldstart)
  let empty = s:Comment[ft].Empty
  if !empty(s:Comment[ft].Inline) && line =~ s:Comment[ft].Inline
    let i = v:foldstart
    while i <= v:foldend && line =~ (s:Comment[ft].Inline . empty)
      let i += 1
      let line = getline(i)
    endwhile
    let text = line
  elseif !empty(s:Comment[ft].Start) 
    let text = line
    if line =~ (s:Comment[ft].Start . empty)
      let firstline = ''
      let middle = empty(s:Comment[ft].Middle) ? '\%\(^\s*\)' : s:Comment[ft].Middle
      for i in range(v:foldstart + 1, v:foldend - 1)
        let line = getline(i)
        if empty(firstline) | let firstline = line | endif
        if line !~ (middle . empty) | break | endif
      endfor
      let text .= substitute(firstline, middle, '', '')
    endif
  else
    let text = line
  endif

  let nline = v:foldend - v:foldstart + 1
  return text . " (+" . nline . ")"
endfunction

set foldenable         " Enable folding
set foldclose=         " Dont autoclose folds on leave
set foldmethod=expr    " use FoldIt

set foldtext=FoldItText()
set foldexpr=FoldItExpr(v:lnum)
set foldopen=hor,insert,jump,mark,percent,quickfix,search,tag,undo

map zr zR
map zm zM
noremap zR zR:echo "Opening all multiline comments..."<CR>
noremap zM zM:echo "Closing all multiline comments..."<CR>

call FoldItDefineComment('vim',   '\%(^\s*"\)',     '',                '',            '',              '-')
call FoldItDefineComment('ruby',  '\%(^\s*#\)',     '',                '',            '',              '')
call FoldItDefineComment('php',   '\%(^\s*\/\/\)',  '\%(^\s*/\*\)',    '',            '\%(^\s*\*/\)',  '')
call FoldItDefineComment('java',  '\%(^\s*\/\/\)',  '\%(^\s*/\*\*\)',  '\%(^\s*\*\)', '\%(^\s*\*/\)',  '')

let &cpo = s:save_cpo
unlet s:save_cpo
