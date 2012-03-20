" ----------------------------------------------------------------------------
"  Java Configuration
" ----------------------------------------------------------------------------

let java_highlight_debug=1
let java_highlight_functions="style"

" Quit when a syntax file was already loaded
" if !exists("main_syntax")
"   if version < 600
"     syntax clear
"   elseif exists("b:current_syntax")
"     finish
"   endif
"   let main_syntax='java'
" endif

command! -nargs=+ JavaHiLink hi link <args>

JavaHiLink   javaParen                  Function
JavaHiLink   javaAnnotation             Special
delcommand JavaHiLink
