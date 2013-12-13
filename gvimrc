" -----------------------------------------------------------
"  gvimrc
" -----------------------------------------------------------
"
winpos 0 0
set columns=239 lines=200

if has("gui_macvim")
  set macmeta                                                            " Enable Alt key to be mapped in MacVim
  set gfn=Mensch:h12
elseif has("gui_gtk")
  set winaltkeys=no                                                      " Enable ALT so maximize tip below can work
  set guifont=Inconsolata-g\ 8
elseif has("gui_win32")
  set guifont=Mensch:h12:cANSI
  set winaltkeys=yes                                                     " Enable ALT so maximize tip below can work
  au GUIEnter * simalt ~x                                                " Maximize window
  set winaltkeys=no                                                      " Remove ALT for menus
  set shellslash                                                         " vim-rooter workaround path separator
  source ~/vimfiles/bundle/snipmate/after/plugin/snipmate.vim            " force snipmate to load on Windows
endif

set antialias
set cursorline
set visualbell t_vb=         " No flash or bell

set guioptions=ec
set guitablabel=%N\ %t\ %m

set clipboard+=unnamed       " put the * register on the system clipboard
