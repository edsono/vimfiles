" =============================================================================
" File:          autoload/ctrlp/notes.vim
" Description:   Example extension for ctrlp.vim
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"     let g:ctrlp_extensions = ['notes']
"
" Where 'notes' is the name of the file 'notes.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ ]

" Get the script's filename, in this example s:n is 'notes'
let s:n = exists('s:n') ? s:n : fnamemodify(expand('<sfile>', 1), ':t:r')

" Load guard
if ( exists('g:loaded_ctrlp_'.s:n) && g:loaded_ctrlp_notes )
  \ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_notes = 1

let s:NotesDir = '~/Dropbox/Notes/'

" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
" + init: the name of the input function including the brackets and any
"         arguments
" + accept: the name of the action function (only the name)
" + lname & sname: the long and short names to use for the statusline
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
" + enter: the name of the function to be called before starting ctrlp
" + exit: the name of the function to be called after closing ctrlp
" + opts: the name of the option handling function called when initialize
" + sort: disable sorting (enabled by default when omitted)
"
call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#'.s:n.'#init()',
  \ 'accept': 'ctrlp#'.s:n.'#accept',
  \ 'lname': 'notes',
  \ 'sname': 'not',
  \ 'type': 'path',
  \ 'sort': 0,
  \ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#notes#init()
  return split(globpath(s:NotesDir, '**/*'), "\n")
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#notes#accept(mode, str)
  call ctrlp#exit()
  if a:mode == 'e'
    exec 'edit ' . a:str
  elseif a:mode == 'h'
    exec 'split ' . a:str
  elseif a:mode == 'v'
    exec 'vsplit ' . a:str
  else
    exec 'tabedit ' . a:str
  endif
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#notes#id()
  return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/notes.vim
" command! CtrlPNotes call ctrlp#init(ctrlp#notes#id())


" vim:fen:fdl=0:ts=2:sw=2:sts=2
