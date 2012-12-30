" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
set nobackup		" do not keep a backup file, use versions instead
else
set backup		" keep a backup file
endif
set history=10000		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
"set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis  | wincmd p | diffthis
endif



"function ToggleHLSearch()
"    if &hls
"        set nohls
"    else
"        set hls
"    endif
"endfunction

map <silent> <C-n> <Esc>:call ToggleHLSearch()<CR>

imap  <F9> <Esc>:wa! <CR>
map  <F9> <Esc>:wa! <CR>
imap  <F9> <Esc>:wa! <CR>

map  <C-h> <Esc>:wincmd h <CR>
imap <C-h> <Esc>:wincmd h <CR>
map  <C-j> <Esc>:wincmd j <CR>
imap <C-j> <Esc>:wincmd j <CR>
map  <C-k> <Esc>:wincmd k <CR>
imap <C-k> <Esc>:wincmd k <CR>
map  <C-l> <Esc>:wincmd l <CR>
imap <C-l> <Esc>:wincmd l <CR>

" resize current buffer by +/- 5 
nnoremap <leader>h :vertical resize -5<cr>
nnoremap <leader>l :vertical resize +5<cr>
nnoremap <leader>j :resize -5<cr>
nnoremap <leader>k :resize +5<cr>

"source /home/milton/cscope_maps.vim



"All the pythong stuff from http://blog.sontek.net/2008/05/11/python-with-a-modular-ide-vim/

autocmd FileType python set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"taglist things
nnoremap <silent> <F10> :TagbarToggle<CR>
let Tlist_Process_File_Always=1

"create tab with f10
nnoremap <silent> <F11> :tabnew<CR>
"browse tab with alt arrow
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
inoremap kj <Esc>
inoremap KJ <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

nnoremap <silent> <F12> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']
let NERDTreeWinSize=40
let g:NERDTreeDirArrows=0


"From http://items.sjbach.com/319/configuring-vim-right
set title
set scrolloff=3
if has('unix')
    set directory=$HOME/.vim/vim_tmp//,/tmp//
    set tags=$HOME/.vim/tags/**/tags
    set backupdir=$HOME/.vim/vim_tmp//,/tmp//
    set backupskip=$HOME/.vim/vim_tmp//,/tmp//
    set udir=$HOME/.vim/vim_tmp//,/tmp//
else
    set tags=$HOME/_vim/tags/**/tags
    set backupdir=$HOME/_vim/vim_tmp//
    set backupskip=$HOME/_vim/vim_tmp//
    set directory=$HOME/_vim/vim_tmp//
endif
"having this set will not leave any addition files around
"after having closed VIM.

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set hidden

runtime macros/matchit.vim
set wildmenu

set splitright
"let mapleader=","
"set relativenumber
set undofile
"nnoremap / /\v
"vnoremap / /\v
"set gdefault

"http://stevelosh.com/blog/2010/09/coming-home-to-vim/
se ic
se is
set showmatch
set smartcase
nnoremap <leader><space> :noh<cr>
"format xml
map <leader>b :%s#><\([^/]\)#>\r<\1#g<cr>
"format json
map <leader>s :%!python -m json.tool<cr>

set wrap
set textwidth=79
set formatoptions=qrnl
set colorcolumn=79
"hi ColorColumn guibg=#232728
hi ColorColumn guibg=#F5F6CE 

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

if has("cscope")
    set csprg=~/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif

nnoremap <F4> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse usage disabled"
    else
        set mouse=a
        echo "Mouse usage enabled."
    endif
endfunction


set guioptions-=T

set noerrorbells
set visualbell
set t_vb =
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
"allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"setting font
if has('gui')
    if has('unix')
        set gfn=inconsolata\ 12
    else
        "windows
        set gfn=Consolas:h10:cANSI
    endif
endif

call pathogen#infect()

"set nowrapscan


"http://vim.wikia.com/wiki/VimTip14
"Highlight matches without moving.
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"Using solarized colorscheme
set background=dark
colorscheme solarized

"use system clipboard --- at last
set clipboard=unnamedplus

