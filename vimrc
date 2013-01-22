set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set encoding=utf8

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
	set mouse=a
	if !has('gui_running')
		" for some reason, doing this directly with 'set ttymouse=xterm2'
		" doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
		" makes tmux enter copy mode instead of selecting or scrolling
		" inside Vim -- but luckily, setting it up from within autocmds
		" works                   
		autocmd VimEnter * set ttymouse=xterm2
		autocmd FocusGained * set ttymouse=xterm2
		autocmd BufEnter * set ttymouse=xterm2
	endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
	colorscheme default "solarized
	set background=light
endif

set smarttab " Enable smart tabs
set autoread " automatically read buffer when changed outside vim
set smartindent

" Enable file type detection.
filetype plugin indent on

"jquery syntax file
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Set directory for backup and swap files
if filewritable("/tmp") && ! filewritable("/tmp/vim")
	silent execute '!umask 002; mkdir /tmp/vim'
endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir /tmp/vim/backups > /dev/null 2>&1
set undodir=/tmp/vim/backups
set undofile

set backupdir=/tmp/vim
set dir=/tmp/vim

" tabstop settings
set shiftwidth=4
set tabstop=4

" show line numbers
set number

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Key mappings
"======================

" F2 to save
nmap <F2> :w!<CR>
imap <F2> <ESC>:w!<CR> i

" clear last search result
nnoremap <silent><F3> :let @/ = ""<CR>

" paste toggle
set pastetoggle=<F4>

" add lines above and below
nnoremap + maO<esc>`a
nnoremap - mao<esc>`a

" Don’t reset cursor to start of line when moving around.
" set nostartofline

" Disable line wrap
set nowrap

" Make regex sane: search with perl regular expressions
nnoremap / /\v
vnoremap / /\v
