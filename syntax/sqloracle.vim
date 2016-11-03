" Vim syntax file
" Language:     SQL, PL/SQL
" Maintainer:   Edson César <edsono AT gmail.com>
" Last Change:  2011 Mai 03

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial  false null true

syn keyword sqlKeyword  access add as asc begin by check cluster column
syn keyword sqlKeyword  compress connect current cursor decimal default desc
syn keyword sqlKeyword  else elsif end exception exclusive file for from
syn keyword sqlKeyword  function group having identified if immediate increment
syn keyword sqlKeyword  index initial into is level loop maxextents mode modify
syn keyword sqlKeyword  nocompress nowait of offline on online start merge
syn keyword sqlKeyword  successful synonym table then to trigger uid matched
syn keyword sqlKeyword  unique user validate values view whenever body
syn keyword sqlKeyword  where with option order pctfree privileges procedure
syn keyword sqlKeyword  public resource return row rowlabel rownum rows
syn keyword sqlKeyword  session share size smallint type using package
syn keyword sqlKeyword  join replace case when tablespace quota maxsize
syn keyword sqlKeyword  datafile permanent management local autoallocate
syn keyword sqlKeyword  segment space auto extent temporary unlimited
syn keyword sqlKeyword  constraint primary key sequence autoextend next
syn keyword sqlKeyword  minvalue maxvalue cache noorder nocycle
syn keyword sqlKeyword  including contents datafiles materialized declare
" SQL*Plus commands
syn keyword sqlKeyword  prompt pause accept define show set clear screen
syn keyword sqlKeyword  off whenever sqlerror exit failure rollback
syn keyword sqlKeyword  serveroutput errors left right outer purge
syn keyword sqlKeyword  partition less than range cascade constraints

syn keyword sqlOperator not and or
syn keyword sqlOperator in any some all between exists
syn keyword sqlOperator like escape
syn keyword sqlOperator union intersect minus
syn keyword sqlOperator prior distinct out

syn match   sqlDelimiter   /\((\|)\|;\|,\|\.\)/
syn match   sqlComparator  /\(>\|<=\|>=\|<>\|=\)/

syn keyword sqlStatement alter analyze audit comment commit create
syn keyword sqlStatement delete drop execute explain grant insert lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint select set
syn keyword sqlStatement foreign references bitmap
syn keyword sqlStatement truncate update

syn keyword sqlFunction  trunc nvl lpad rpad decode
syn keyword sqlFunction  to_date to_char to_number sysdate

syn keyword sqlType     boolean char character date float integer long
syn keyword sqlType     mlslabel number raw rowid varchar varchar2 varray

" Strings and characters:
syn region sqlString            start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString            start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match sqlNumber             "-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment    start="/\*"  end="\*/" contains=sqlTodo
syn match sqlComment    "--.*$" contains=sqlTodo

syn sync ccomment sqlComment

" Todo.
syn keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE

hi link sqlComment     Comment
hi link sqlNumber      Number
hi link sqlString      String

hi link sqlOperator    Statement
hi link sqlComparator  Special
hi link sqlDelimiter   Delimiter

hi link sqlKeyword     Statement
hi link sqlStatement   Statement
hi link sqlFunction    Function

hi link sqlType        Type
hi link sqlTodo        Todo
hi link sqlSpecial     Special

let b:current_syntax = "sql"

" vim: ts=8
