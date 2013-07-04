"---------------------------------------
" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options.
"---------------------------------------
set nocompatible
"---------------------------------------
" Sensible
" https://github.com/tpope/vim-sensible
"---------------------------------------
"runtime! plugin/sensible.vim
"filetype off
"---------------------------------------
" Pathogen
"---------------------------------------
execute pathogen#infect()
"---------------------------------------
" VUNDLE
"---------------------------------------
"set rtp+=~/.vim/bundle/vundle
"call vundle#rc()
"Bundle 'gmarik/vundle'
" --------------------
" useful tools
" --------------------
"Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
"Bundle 'joonty/vdebug'
" --------------------
" highlighting
" --------------------
"Bundle 'jelera/vim-javascript-syntax'
"Bundle 'cakebaker/scss-syntax.vim'
"Bundle 'tpope/vim-haml'
" --------------------
" color schemes
" --------------------
"Bundle 'daylerees/colour_schemes'
"Bundle 'sickill/vim-monokai'
"Bundle 'jaromero/vim-monokai-refined'
"Bundle 'Lokaltog/vim-distinguished'
" --------------------
" vim-snipmate
" --------------------
"Bundle 'garbas/vim-snipmate'
"Bundle 'tomtom/tlib_vim'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'honza/vim-snippets'
"Bundle 'kwaledesign/scss-snippets'
filetype plugin indent on
"---------------------------------------
colorscheme incaic
"---------------------------------------
" backup files (files~)
"---------------------------------------
if isdirectory('~/.vim/_bkup') == 0
  :silent !mkdir -p ~/.vim/_bkup >/dev/null 2>&1
endif
set backup backupdir=~/.vim/_bkup
"---------------------------------------
" swap files (.files or files.swp)
"---------------------------------------
if isdirectory('~/.vim/_swap') == 0
  :silent !mkdir -p ~/.vim/_swap >/dev/null 2>&1
endif
set directory=~/.vim/_swap
"---------------------------------------
" undo files  (only for 7.3+)
"---------------------------------------
if exists("+undofile")
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/_undo') == 0
    :silent !mkdir -p ~/.vim/_undo > /dev/null 2>&1
  endif
  set undofile undodir=~/.vim/_undo
endif
"---------------------------------------
" Status Line setup
"---------------------------------------
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*%y%=%{v:register}\ %* "active copy/paste register
"set statusline +=%2*0x%04B\ %*          "character under cursor
"---------------------------------------
set cursorline
"---------------------------------------
" title String
"---------------------------------------
"set title titlestring=%<%{getcwd()}%=[%t] titlelen=80
set title titlestring=%{getcwd()} titlelen=80
"--------------------------------------
" Let Buffers be modifiable
"---------------------------------------
set modifiable
"---------------------------------------
" Complete till longest common string, List all matches
"---------------------------------------
set wildmode=longest,list
"---------------------------------------
" read/write a .viminfo file, don't store more
" than 50 lines of registers
"---------------------------------------
set viminfo='20,\"50,h,%,n~/.vim/_viminfo
"---------------------------------------
" Set behavior for mouse and selection
"---------------------------------------
behave xterm
"---------------------------------------
" Switch on search pattern highlighting
"---------------------------------------
set hlsearch
"---------------------------------------
" enable mouse
"---------------------------------------
set mouse=a
"---------------------------------------
" Pop-up window when right-click
"---------------------------------------
set mousemodel=popup
"---------------------------------------
" Hide the mouse pointer while typing
"---------------------------------------
set mousehide
"---------------------------------------
" Always show line numbers
"---------------------------------------
set number
"---------------------------------------
" smartindent
"---------------------------------------
set smartindent
"---------------------------------------
" automatically write when change focus
"---------------------------------------
set autowrite
"---------------------------------------
" always set autoindenting on
"---------------------------------------
set autoindent
"---------------------------------------
" keep a backup file
"---------------------------------------
set backup
"---------------------------------------
" ignore case when searching
" smartcase: overide 'ic' when search pattern is UC
"---------------------------------------
set ignorecase smartcase
"---------------------------------------
" set visual bell and disable screen flash
"---------------------------------------
set vb t_vb=
"---------------------------------------
" Make command line two lines high
"---------------------------------------
"set ch=2
"---------------------------------------
" Show the matching bracket for # of tenths of seconds
"---------------------------------------
set matchtime=20
"---------------------------------------
" Match <> Pairs
"---------------------------------------
set matchpairs+=<:>
"---------------------------------------
" setup how cursor looks
"---------------------------------------
"set guicursor=n-v-c:block-Cursor-blinkwait5-blinkoff100-blinkon125,ve:ver35-Cursor-blinkwait5-blinkoff100-blinkon125,o:hor50-Cursor-blinkwait5-blinkoff100-blinkon125,i-ci:ver25-Cursor-blinkwait5-blinkoff100-blinkon125,r-cr:hor20-Cursor-blinkwait5-blinkoff100-blinkon125,sm:block-Cursor-blinkwait5-blinkoff100-blinkon125
"set guicursor=n-v-c:block-blinkon0-Cursor/lCursor
"set guicursor+=ve:ver35-Cursor
"set guicursor+=o:hor50-Cursor
"set guicursor+=i-ci:ver25-Cursor/lCursor
"set guicursor+=r-cr:hor20-Cursor/lCursor
"set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
"---------------------------------------
" List mode characters
"---------------------------------------
"set listchars=extends:>,tab:>-,trail:-
"---------------------------------------
" avoid wrapping lines to mix with line numbers
"---------------------------------------
set showbreak=>\
"---------------------------------------
" Minimum # of screen lines to keep above and below
"---------------------------------------
set scrolloff=2
"---------------------------------------
" set everything to 2 spaces
"---------------------------------------
set tabstop=2 softtabstop=2  shiftwidth=2 expandtab
"---------------------------------------
" Prevent Vim from clobbering the scrollback buffer
" http://www.shallowsky.com/linux/noaltscreen.html
"---------------------------------------
set t_ti= t_te=
"---------------------------------------
" expression evaluated
"---------------------------------------
set showcmd
"---------------------------------------
" Vertical color line at column 80
"---------------------------------------
if version >= 703
  set colorcolumn=81
endif
"---------------------------------------
"set diffexpr=MyDiff()
"---------------------------------------
" Fold settings
"---------------------------------------
set foldmethod=marker foldcolumn=2 foldminlines=1
"set foldtext=v:folddashes.substitute(getline(v:foldstart+1),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
"---------------------------------------
" Show trailing whitespace
" Remove trailing whitespace
"---------------------------------------
match ExtraWhitespace /\s\+$/
nnoremap ,rtw :%s/\s\+$//e<CR>
"------------------------------------------------------------------------------
"	LETTING
"------------------------------------------------------------------------------
" XDebug
"---------------------------------------
let g:vdebug_features = {
\  'max_children' : 512,
\  'max_data' : 2048,
\  'max_depth' : 10
\}
"---------------------------------------
" Nerdtree
"---------------------------------------
let NERDTreeShowHidden=1
"---------------------------------------
" Horizontally Bottom Browsing in Directory Listing
"---------------------------------------
let g:netrw_alto=1
"---------------------------------------
" Vertically Right Browsing in Directory Listing
"---------------------------------------
let g:netrw_altv=1
"---------------------------------------
"enable/supress the banner
"---------------------------------------
let g:netrw_banner=0
"---------------------------------------
"don't cache dirs, always show actual content
"---------------------------------------
let g:netrw_fastbrowse=0
"---------------------------------------
" Highlight strings inside C comments
"---------------------------------------
let c_comment_strings=1
"---------------------------------------
" PHP stuff - suggested by Drupal
"---------------------------------------
" SQL syntax highlighting inside Strings
"---------------------------------------
let php_sql_query=1
"---------------------------------------
" highlighting the Baselib methods
"---------------------------------------
let php_baselib=1
"---------------------------------------
" HTML syntax highlighting inside strings
"---------------------------------------
let php_htmlInStrings=1
"---------------------------------------
" folding for classes and functions
"---------------------------------------
let php_folding=1
"---------------------------------------
" old colorstyle
"---------------------------------------
"let php_oldStyle=1
"---------------------------------------
" short tags
"---------------------------------------
"let php_noShortTags=1
"---------------------------------------
" highlighting parent error ] or )
"---------------------------------------
"let php_parent_error_close=1
"---------------------------------------
" skipping a php end tag, if there exists
" an open ( or [ without a closing one
"---------------------------------------
"let php_parent_error_open=1
"---------------------------------------
" Selecting syncing method:
" x = -1 : sync by search (default)
" x > 0  : sync at least x lines backward
" x = 0  : sync from start
"---------------------------------------
"let php_sync_method=x
"------------------------------------------------------------------------------
"	MAPS - Alphabetical Chars
"------------------------------------------------------------------------------
" graphical lines downward
"---------------------------------------
map j gj
"---------------------------------------
" graphical lines upward
"---------------------------------------
map k gk
"---------------------------------------
" Don't use Ex mode,use Q for formatting
"---------------------------------------
map Q gq
"------------------------------------------------------------------------------
"	MAPS - <F#> Chars
"------------------------------------------------------------------------------
" Align on =
"---------------------------------------
"map <F2> :!align<CR>
"---------------------------------------
" Align on <=
"---------------------------------------
"map <F3> :!align \<=<CR>
"---------------------------------------
" echo syntax group of word under cursor
"---------------------------------------
map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<CR>
"------------------------------------------------------------------------------
"	MAPS - < Chars
"------------------------------------------------------------------------------
" Move to tab left, right
"---------------------------------------
map <H <ESC>gT<CR>
map <L <ESC>gt<CR>
"------------------------------------------------------------------------------
"	MAPS - , Chars
"------------------------------------------------------------------------------
" cd to the current buffer's directory
"---------------------------------------
map ,cd :cd %:p:h<CR>:echo ''<CR>
"---------------------------------------
" refresh current file
"---------------------------------------
"map ,e :e %<CR>
"---------------------------------------
" find and Open file in current window
"---------------------------------------
"map ,f :find <cfile>.v<CR>
"---------------------------------------
" Move to window split below, above, right, left
"---------------------------------------
map ,j <C-w>j
map ,k <C-w>k
map ,l <C-w>l
map ,h <C-w>h
"---------------------------------------
" set/unset wrap
"---------------------------------------
map ,nw :set nowrap<CR>
map ,yw :set wrap<CR>
"---------------------------------------
" Toggle paste
"---------------------------------------
nnoremap ,p :set invpaste paste?<CR>
set pastetoggle=,p
set showmode
"---------------------------------------
" squeeze lines
"---------------------------------------
map ,sl :g/^$/,/./-j
"---------------------------------------
" Open NERD Tree
"---------------------------------------
map ,t :NERDTreeToggle<CR>
"---------------------------------------
" XDebug - Run
"---------------------------------------
map ,vr <F5>
"---------------------------------------
" XDebug - Run to Cursor
"---------------------------------------
map ,vrc <F9>
"---------------------------------------
" XDebug - Step Over
"---------------------------------------
map ,vsv <F2>
"---------------------------------------
" XDebug - Step Into
"---------------------------------------
map ,vsi <F3>
"---------------------------------------
" XDebug - Step Out
"---------------------------------------
map ,vso <F4>
"---------------------------------------
" XDebug - Close
"---------------------------------------
map ,vc <F6>
"---------------------------------------
" XDebug - Detach
"---------------------------------------
map ,vd <F7>
"---------------------------------------
" XDebug - Set Breakpoint
"---------------------------------------
map ,vb <F10>
"---------------------------------------
" XDebug - Get Context
"---------------------------------------
map ,vg <F11>
"---------------------------------------
" XDebug - Eval Under Cursor
"---------------------------------------
map ,vec <F12>
"---------------------------------------
" XDebug - VdebugBreakpoints
"---------------------------------------
map ,vbw :BreakpointWindow<CR>
"---------------------------------------
" XDebug - VdebugBreakpoints
"---------------------------------------
map ,vbr :BreakpointRemove
"---------------------------------------
" XDebug - VdebugEval
"---------------------------------------
map ,ve :VdebugEval
"------------------------------------------------------------------------------
"	MAPS - \ Chars
"------------------------------------------------------------------------------
" WinPos 0 WIDE (0 0)
"---------------------------------------
map \0 :winpos 0 0<CR>:echo '\0 : 0 0'<CR>
"---------------------------------------
" WinPos 1 WIDE (starting from right)
"---------------------------------------
map \1 :winpos 1414 0<CR>:echo '\1 : 1414 0'<CR>
"---------------------------------------
" WinPos 2 WIDE (starting from right)
"---------------------------------------
map \2 :winpos 909 0<CR>:echo '\2 : 909 0'<CR>
"---------------------------------------
" WinPos 3 WIDE (starting from right)
"---------------------------------------
map \3 :winpos 405 0<CR>:echo '\3 : 405 0'<CR>
"---------------------------------------
" Make subwindow larger
"---------------------------------------
map \a <C-w>_
"---------------------------------------
" delete everything on the current window
"---------------------------------------
map \c ggVGd
"---------------------------------------
" diff of modified buffer with saved file
"---------------------------------------
map \d :w !diff % -<CR>
"---------------------------------------
" Move to next window split and make larger
"---------------------------------------
map \j <C-w>j<C-w>_
"---------------------------------------
" Move to previous window split and make larger
"---------------------------------------
map \k <C-w>k<C-w>_
"---------------------------------------
" ls -l in current directory
"---------------------------------------
map \l :!ls -laF<CR>:echo "---------- pwd ----------"<CR>:pwd<CR>
"---------------------------------------
" Temporarily remove highlighting.
"---------------------------------------
map \n :nohlsearch<CR>:echo ''<CR>
"---------------------------------------
" view $PWD
"---------------------------------------
"nnoremap \P :set paste<CR>O<C-R>"<Esc>:set nopaste<CR>
"nnoremap \p :set paste<CR>o<C-R>"<Esc>:set nopaste<CR>
"----------
"use :put! to put the text above
"use :put  to put the text below
":put x (appends contents of register x)
"map \p :pwd<CR>
"---------------------------------------
" delete buffer but don't quit gvim
"---------------------------------------
map \q :bd<CR>
"---------------------------------------
" cd .. from current directory
"---------------------------------------
map \u :cd ..<CR>\l
"---------------------------------------
" write buffer but don't quit gvim
"---------------------------------------
map \w :w<CR>
"-----------------------------------------------------------------------------
" MAPS - Ctrl Chars
"-----------------------------------------------------------------------------
" Select All
"---------------------------------------
map <C-a> ggVG
"---------------------------------------
" jump next, previous
"---------------------------------------
map <C-n> <C-i>
map <C-p> <C-o>
"---------------------------------------
" Jump 10 lines down, up, left, right
"---------------------------------------
map <C-j> 10j
map <C-k> 10k
map <C-h> 10h
map <C-l> 10l
"------------------------------------------------------------------------------
"	MAPS - Other Chars
"------------------------------------------------------------------------------
" Make shift-insert work like in Xterm
"---------------------------------------
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
"------------------------------------------------------------------------------
"	INSERT MAPS - \ Chars
"------------------------------------------------------------------------------
" comment divider 20, 40, 80
"---------------------------------------
imap \l --------------------
imap \ll ----------------------------------------
imap \lll --------------------------------------------------------------------------------
" write file out without getting out
" of insert mode
"---------------------------------------
imap \r <Esc>:w<CR>a
"---------------------------------------
" quit file without getting out of
" insert mode
"---------------------------------------
imap \q <Esc>:bd<CR>
"---------------------------------------
" move left by word boundary
"---------------------------------------
imap <C-b> <S-Left>
"---------------------------------------
" move down half a page
"---------------------------------------
imap <C-d> <S-Down>
"---------------------------------------
" Delete
"---------------------------------------
imap <C-e> <Del>
"---------------------------------------
" heuristics-based omni completion
"---------------------------------------
map <C-f> <C-x> <C-o>
"---------------------------------------
" move left
"---------------------------------------
imap <C-h> <Left>
"---------------------------------------
" move down
"---------------------------------------
imap <C-j> <Down>
"---------------------------------------
" move up
"---------------------------------------
imap <C-k> <Up>
"---------------------------------------
" move right
"---------------------------------------
imap <C-l> <Right>
"---------------------------------------
" Redo
"---------------------------------------
imap <C-r> <C-o><C-r>
"---------------------------------------
" move up half a page
"---------------------------------------
imap <C-u> <S-Up>
"---------------------------------------
" move right by word boundary
"---------------------------------------
imap <C-w> <S-Right>
"---------------------------------------
" Undo
"---------------------------------------
imap <C-z> <C-o>u
"---------------------------------------
" Home
"---------------------------------------
imap <C-0> <Home>
"---------------------------------------
" End
"---------------------------------------
imap <C-$> <End>
"------------------------------------------------------------------------------
"	VISUAL MAPS - Alphabetical Chars
"------------------------------------------------------------------------------
" Make p in Visual mode replace the
" selected text with the "" register.
"---------------------------------------
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
"------------------------------------------------------------------------------
" Color Management
"------------------------------------------------------------------------------
function Do256()
  " Enable 256 colors
  set t_Co=256
  set t_AB=[48;5;%dm
  set t_AF=[38;5;%dm
endfu
function UnDo256()
  " Disable 256 colors
  set t_Co &vim
  set t_AB &vim
  set t_AF &vim
endfu
if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0 || match($TERM, 'screen') == 0
  call Do256()
endif
com! -nargs=* Color256 exe Do256()
com! -nargs=* UnColor256 exe UnDo256()
"------------------------------------------------------------------------------
" AUTOCOMMANDS
"------------------------------------------------------------------------------
if has('autocmd')
  "---------------------------------------
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  "---------------------------------------
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  "----------------------------------------------------------------------------
  " Drupal files
  "----------------------------------------------------------------------------
  augroup module
    au BufRead,BufNewFile {*.install,*.module}   set filetype=php
  augroup END
endif
