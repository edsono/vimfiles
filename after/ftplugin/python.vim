" ----------------------------------------------------------------------------
"  Python Plugin Configuration
" ----------------------------------------------------------------------------

setlocal tabstop=2

setlocal include=^#\s*import 
setlocal includeexpr=

setlocal suffixesadd=.py
setlocal path=.,src/**,test/**

nmap <buffer> <leader>r :w \| !clear && PYTHONPATH=$PWD python %<CR>
nmap <buffer> <leader>d :w \| !clear && PYTHONPATH=$PWD python -m pudb.run %<CR>
