" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------

" Do not show files...
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.pyc$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_extensions = ['skel']
command! CtrlPSkel call ctrlp#init(ctrlp#skel#id())

" let g:ctrlp_map = '<Leader>p'

nnoremap <Leader>pp :CtrlP<cr>
nnoremap <Leader>pm :CtrlPMRU<cr>
nnoremap <Leader>ps :CtrlPRTS<cr>
nnoremap <Leader>pn :CtrlPSkel<cr>
nnoremap <Leader>pb :CtrlPBuffer<cr>
nnoremap <Leader>pf :CtrlPClearCache<cr>
nnoremap <Leader>pF :CtrlPClearAllCaches<cr>
