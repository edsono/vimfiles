" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------

" Do not show files...
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.pyc$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_extensions = ['skel', 'notes']
command! CtrlPSkel call ctrlp#init(ctrlp#skel#id())
command! CtrlPNotes call ctrlp#init(ctrlp#notes#id())

let g:ctrlp_map = '<Leader>a'

nnoremap <Leader>a :CtrlP<cr>
nnoremap <Leader>am :CtrlPMRU<cr>
nnoremap <Leader>as :CtrlPRTS<cr>
nnoremap <Leader>an :CtrlPSkel<cr>
nnoremap <Leader>ae :CtrlPNotes<cr>
nnoremap <Leader>ab :CtrlPBuffer<cr>
nnoremap <Leader>af :CtrlPClearCache<cr>
nnoremap <Leader>aF :CtrlPClearAllCaches<cr>
