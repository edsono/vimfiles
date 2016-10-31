" ----------------------------------------------------------------------------
"  Python Plugin Configuration
" ----------------------------------------------------------------------------

setlocal tabstop=4

setlocal include=^#\s*import 
setlocal includeexpr=

setlocal suffixesadd=.py
setlocal path=.,src/**,test/**

nmap <buffer> <leader>r :w \| !clear && PYTHONPATH=$PWD:$PYTHONPATH python %<CR>
nmap <buffer> <leader>d :w \| !clear && PYTHONPATH=$PWD:$PYTHONPATH python -m pudb.run %<CR>
