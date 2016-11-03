" ----------------------------------------------------------------------------
"  FileType Auto Commands
" ----------------------------------------------------------------------------

augroup epub
  au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
augroup END

augroup pandoc
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=pandoc
  autocmd FileType pandoc setl tw=78 formatoptions=tqn
augroup END

augroup tex
  autocmd!
  autocmd FileType tex compiler latexmk
  autocmd FileType tex setl wrap linebreak nolist
augroup END

augroup plaintex
  autocmd!
  autocmd FileType plaintex setl wrap linebreak nolist
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

augroup c
  autocmd!
  autocmd BufEnter *.c,*.h compiler gcc
  autocmd BufWritePost *.rb :CtagsUpdate
  let g:compiler_gcc_ignore_unmatched_lines=1
augroup END

augroup python
  autocmd!
  autocmd BufEnter *.python :Rooter
  autocmd BufNewFile,BufRead *.py compiler python
  autocmd BufWritePost *.py :CtagsUpdate
augroup END

augroup java
  autocmd!
  autocmd BufEnter *.java :Rooter
augroup END

augroup delphi
  autocmd!
  autocmd BufEnter *.dpr,*.DPR,*.pas,*.PAS :Rooter
augroup END
