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
call plug#begin('~/.vim/plugged')

"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()

"So vundle will update itself
Plug 'gmarik/Vundle.vim'

Plug 'junegunn/seoul256.vim'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Goyo and Limelight options
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
""""""""""

Plug 'plasticboy/vim-markdown'

Plug 'reedes/vim-pencil'

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'

""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
"""""""""""

Plug 'easymotion/vim-easymotion'

Plug 'pangloss/vim-javascript'

"{{{2 YouCompleteMe - Advanced code completion for C languages
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
    "let g:ycm_autoclose_previw_window_after_insertion = 1
    "Special instructions: When YCM updates, it often needs a recompile
    "By default, that is done by running ~/.vim/bundle/YouCompleteMe/install.sh

Plug 'altercation/vim-colors-solarized'

Plug '907th/vim-auto-save'
let g:auto_save = 0
let g:auto_save_in_insert_mode = 0

Plug 'ryanss/vim-hackernews'

call plug#end()


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

" Switch syntax highlighting on, when the terminal has colors Also switch on
" highlighting the last used search pattern.

if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
autocmd FileType text set autoindent
au BufRead,BufNewFile *.md set filetype=markdown


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

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

"create tab with f11
nnoremap <silent> <F11> :tabnew<CR>
nnoremap <silent> <C-F11> :tabclose <CR>
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
"set relativenumber
set undofile

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
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
au FileType gitcommit set textwidth=72

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
        set gfn=inconsolata\ 11
    else
        "windows
        set gfn=Consolas:h10:cANSI
    endif
endif


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
" When without gui solarized works properly when t_Co set to 16
set background=light 
colorscheme solarized
if !has("gui_running")
    set t_Co=16
endif

"use system clipboard --- at last
set clipboard=unnamedplus

"------------------------------------------------------------
" CtrlP
"------------------------------------------------------------
" Set the max files
" let g:ctrlp_max_files = 0
 
" from : https://gist.github.com/mitchellh/ee14d6ecb9196a07da56
" Optimize file searching
" if has("unix")
"     let g:ctrlp_user_command = {
"                 \   'types': {
"                 \       1: ['.git/', 'cd %s && git ls-files']
"                 \   },
"                 \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
"                \ }
"endif
"
"



