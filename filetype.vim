" ----------------------------------------------------------------------------
"  FileType Auto Commands
" ----------------------------------------------------------------------------

augroup epub
  au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
augroup END

augroup txt
  autocmd!
  autocmd FileType text setl tw=78 formatoptions=tq
augroup END

augroup tex
  autocmd!
  autocmd FileType tex compiler latexmk
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
augroup END

augroup delphi
  autocmd!
  autocmd BufEnter *.dpr,*.DPR,*.pas,*.PAS :Rooter
augroup END
