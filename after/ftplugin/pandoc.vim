" ----------------------------------------------------------------------------
"  Pandoc Plugin Configuration
" ----------------------------------------------------------------------------
let g:pandoc_auto_format = 1
let g:pandoc_use_hard_wraps = 1

nmap <buffer> <leader>q :w \| !pandoc -s -t html5 --mathjax -V revealjs-url="http://localhost/reveal.js" % \| bcat<CR>
nmap <buffer> <leader>r :w \| !pandoc -s -i -t revealjs --mathjax -V transition="linear" -V theme="notes" -V revealjs-url="http://localhost/reveal.js" % \| bcat<CR>

