" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------

let g:ctrlp_extensions = ['skel']
command! CtrlPSkel call ctrlp#init(ctrlp#skel#id())

let g:ctrlp_map = '<Leader>a'

nnoremap <Leader>a :CtrlP<cr>
nnoremap <Leader>m :CtrlPMRU<cr>
nnoremap <Leader>s :CtrlPRTS<cr>
nnoremap <Leader>n :CtrlPSkel<cr>
nnoremap <Leader>b :CtrlPBuffer<cr>
nnoremap <Leader>f :CtrlPClearCache<cr>
nnoremap <Leader>F :CtrlPClearAllCaches<cr>
