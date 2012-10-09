" ----------------------------------------------------------------------------
"  Latex-Box
" ----------------------------------------------------------------------------

" Mappings
imap <buffer> [[         \begin{
imap <buffer> ]]         <Plug>LatexCloseCurEnv
nmap <buffer> <Leader>le <Plug>LatexChangeEnv
vmap <buffer> <Leader>lw <Plug>LatexWrapSelection
vmap <buffer> <Leader>lW <Plug>LatexEnvWrapSelection
imap <buffer> ((         \eqref{

" Skim viewer
let g:LatexBox_autojump = 1
let g:LatexBox_viewer = 'skim'
let g:LatexBox_latexmk_options = '-pvc'

" Usar SyncTeX com o Skim Previewer
map <silent> <Leader>ls :silent execute "!/Applications/Skim.app/Contents/SharedSupport/displayline " . <C-R>=line('.')<CR> . " <C-R>=LatexBox_GetOutputFile()<CR> " . expand("%:p") \| redraw! <CR>
