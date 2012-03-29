" ----------------------------------------------------------------------------
"  FileType Auto Commands
" ----------------------------------------------------------------------------

augroup tex
  autocmd!
  " autocmd FileType tex setl wrap linebreak nolist
  autocmd FileType tex setl tw=78 formatoptions=tq
augroup END

" don't use cindent for javascript
augroup javascript
  autocmd!
  autocmd FileType javascript setl nocin et ts=4 sts=4 sw=4 fdm=indent fdl=1
augroup END

augroup ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb compiler ruby
  autocmd BufNewFile,BufRead test_*.rb,*_test.rb compiler rubytest
  autocmd BufWritePost *.rb :CtagsUpdate
augroup END

let g:compiler_gcc_ignore_unmatched_lines=1
augroup c
  autocmd!
  autocmd BufEnter *.c,*.h compiler gcc
  autocmd BufWritePost *.rb :CtagsUpdate
augroup END

augroup java
  autocmd!
  autocmd BufEnter *.java :Rooter
  autocmd BufEnter *.java set makeprg=ant\ -emacs
  autocmd BufEnter *.java setlocal keywordprg=
augroup END

augroup delphi
  autocmd!
  autocmd BufEnter *.dpr,*.DPR,*.pas,*.PAS :Rooter
  autocmd BufNewFile,BufRead *.dpr,*.DPR,*.pas,*.PAS set ff=dos
  autocmd BufNewFile,BufRead *.dpr,*.DPR,*.pas,*.PAS set fenc=latin1
  autocmd BufNewFile,BufRead *.dpr,*.DPR,*.pas,*.PAS compiler delphi
augroup END
