" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

set nocompatible                               " essential
set encoding=utf-8                             " default encoding
set history=1000                               " lots of command line history
set confirm                                    " error files / jumping
set ffs=unix,dos,mac                           " support these files
set isk+=_,$,@,%,#,-                           " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                                   " make sure modeline support is enabled
set autoread                                   " reload files (no local changes only)
set tabpagemax=50                              " open 50 tabs max
set shortmess=filmnrxoO                        " abbrev. of messages (avoids 'hit enter')
set completeopt=menu,preview,longest           " complete options
set spell spelllang=pt,en

" Supertab
let g:SuperTabCrMapping=1
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabMappingBackward='<Leader><TAB>'  " access Supertab when Snipmate is 'running'

filetype off

" Check Vundle or exit
let iCanHazVundle=1
if filereadable(expand('~/.vim/bundle/vundle/autoload/vundle.vim'))
  set rtp+=~/.vim/bundle/vundle/
else
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github repos
Bundle 'edsono/vim-dbext.git'
Bundle 'edsono/vim-delphi.git'
Bundle 'edsono/reload.vim.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'edsono/snipmate.vim.git'
Bundle 'edsono/vim-autoclose.git'
Bundle 'edsono/vim-viewoutput.git'

Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-unimpaired.git'

Bundle 'kien/ctrlp.vim.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'sjl/vitality.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'airblade/vim-rooter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'Lokaltog/vim-powerline.git'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

syntax on
filetype plugin indent on

" ----------------------------------------------------------------------------
" Backups
" ----------------------------------------------------------------------------

set autowrite                                  " autowrite files
set nobackup                                   " do not keep backups after close
set nowritebackup                              " do not keep a backup while working
set noswapfile                                 " don't keep swp files either
set backupcopy=yes                             " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

if has("unix")
  set backupdir=~/.vim/backup                  " store backups under
  set directory=~/.vim/swap//,.,~/tmp,/tmp     " keep swp files under
else
  set backupdir=$HOME/vimfiles/backup                " store backups under
  set directory=$HOME/vimfiles/swap//,c:\tmp,c:\temp " keep swp files under
endif

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                                      " show the cursor position all the time
set showcmd                                    " display incomplete commands
set nolazyredraw                               " turn off lazy redraw
set relativenumber                             " relative line numbers
set cmdheight=2                                " command line height
set backspace=2                                " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]                     " backspace and cursor keys wrap to
set shortmess=filtIoOA                         " shorten messages
set report=0                                   " tell us about changes
set nostartofline                              " don't jump to the start of line when scrolling
set showtabline=2                              " always show tabline
set wildmenu                                   " turn on wild menu
set wildmode=list:longest,full

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set title                                      " make vim to show in xterm his title
set showmatch                                  " brackets/braces that is
set matchtime=5                                " duration to show matching brace (1/10 sec)
set incsearch                                  " do incremental searching
set laststatus=2                               " always show the status line
set ignorecase                                 " ignore case when searching
set smartcase                                  " case sensitivity only if there is a capital letter
set nohlsearch                                 " don't highlight searches
set visualbell                                 " shut the fuck up
set hidden                                     " don't warning about unsaved buffers
set scrolloff=3                                " always show 3 lines around cursor lines
set diffopt=filler,foldcolumn:0                " dont show foldcolumn on diff
set switchbuf=useopen,usetab,split             " always open another buffer (quickfix)
set list listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:• " use the same symbols as TextMate for tabstops and EOLs
set fillchars=fold:\ ,diff:-

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set tabstop=2
set autoindent                                 " automatic indent new lines
set smartindent                                " be smart about it
set nowrap                                     " do not wrap lines
set softtabstop=2                              " yep, two
set shiftwidth=2                               " ..
set expandtab                                  " expand tabs to spaces
set nosmarttab                                 " fuck tabs
set formatoptions+=n                           " support for numbered/bullet lists
set textwidth=0                                " no wrap at all by default
set virtualedit=block                          " allow virtual edit in visual block ...

" ----------------------------------------------------------------------------
" Other Configurations
" ----------------------------------------------------------------------------

" pastetoggle
set pastetoggle=<C-q>

" jump to last position of buffer when opening
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal g'\"" | endif

" CursorLine only in active window
set cursorline
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" ----------------------------------------------------------------------------
" Commands
" ----------------------------------------------------------------------------

if has("unix")
  " Save readonly files with sudo
  command! W w !sudo tee % > /dev/null

  " make file executable
  command! -nargs=* Xe !chmod +x <args>
  command! -nargs=0 Xe !chmod +x %
endif

command! -complete=help -nargs=1 Ht :tab help <args>
command! -complete=help -nargs=1 H  :vertical botright help <args>

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------

" Sane marks
nnoremap ' `
nnoremap ` '

" open files in another window
nnoremap gf     <C-W>f

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" Sane movement with wrap turned on
nnoremap j      gj
nnoremap k      gk
vnoremap j      gj
vnoremap k      gk
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap <Down> gj
vnoremap <Up>   gk

" repeat . in to each line in visual selection
vnoremap . :normal .<CR>

" window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ident and stay in visualmode
vnoremap < <gv
vnoremap > >gv

" move lines around
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" tcsh style on command line
cnoremap <C-A> <Home>
cnoremap <C-D> <Del>

" ----------------------------------------------------------------------------
"  Leader Mappings
" ----------------------------------------------------------------------------

" search text recently deleted
nnoremap <Leader>n /<C-R>"<CR>
nnoremap <Leader>N ?<C-R>"<CR>

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" ----------------------------------------------------------------------------
" Terminal Support
" ----------------------------------------------------------------------------

" sane arrows
" map <Esc>[A <Up>
" map <Esc>[B <Down>
" map <Esc>[C <Right>
" map <Esc>[D <Left>

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

if !has("gui_running")
  if &term =~? '256color'
    set t_Co=256
    let g:solarized_termcolors=256
  endif
  set mouse=a
  set timeout
  set ttimeout
  set timeoutlen=500
  set ttimeoutlen=100
endif

" ----------------------------------------------------------------------------
" Background & Theme
" ----------------------------------------------------------------------------

set background=dark
colorscheme ecolarized


" ----------------------------------------------------------------------------
" Source Local Configuration
" ----------------------------------------------------------------------------

if has("unix") && filereadable($HOME . '/.lvimrc')
  source $HOME/.lvimrc
elseif filereadable($HOME . '/_lvimrc')
  source $HOME/_lvimrc
endif

