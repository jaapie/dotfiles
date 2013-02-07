set nocompatible

" let pathogen do its thing
execute pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=500		" keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set encoding=utf8
set whichwrap+=<,>,h,l
set magic
set mat=2
set noerrorbells
set novisualbell
set pastetoggle=<F4>
set nowrap
set nolist listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
" set foldmethod=marker

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
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
if &t_Co > 2 
	syntax on
	set hlsearch
	colorscheme default 
	set background=light
endif

if has("gui_running")
	colorscheme solarized
	set background=light
endif

set smarttab " Enable smart tabs
set autoread " automatically read buffer when changed outside vim
set smartindent

" Enable file type detection.
filetype plugin indent on

"Enable OmniComplete on different filetypes
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.  Only define it when not
" defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Set directory for backup and swap files
if filewritable("/tmp") && ! filewritable("/tmp/vim")
	silent execute '!umask 002; mkdir /tmp/vim'

	set dir=/tmp/vim
	set backupdir=/tmp/vim

	" ================ Persistent Undo ==================
	" Keep undo history across sessions, by storing in file.
	" Only works all the time.

	silent !mkdir /tmp/vim/backups > /dev/null 2>&1
	set undodir=/tmp/vim/backups
	set undofile

endif


" tabstop settings
set shiftwidth=4
set tabstop=4

" show line numbers
set number

" Key mappings
"======================

" Session management
nmap <silent><F6> :mksession! ~/.vim_session <CR> " Quick write session with F6
nmap <silent><F7> :source ~/.vim_session <CR>     " And load session with F7--like Quake quick save

let mapleader = ","

" F2 to save
nmap <F2> :w!<CR>
imap <F2> <ESC>:w!<CR> i

" clear last search result
nnoremap <silent><F3> :nohlsearch<CR>

" add lines above and below
nnoremap + maO<esc>`a
nnoremap - mao<esc>`a

" Yank to the OS clipboard with ,y
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy

" Make regex sane: search with perl regular expressions
nnoremap / /\v
vnoremap / /\v

map <leader>oo o<cr>
map <leader>d diw
map <leader>= =iB
imap <silent> <leader>zc <C-y>,
nmap <silent> <leader>zc <C-y>,
map <leader>ws :w<cr>:so %<cr>
map <leader>pc "*p
inoremap jj <ESC>
map <silent><leader>i :set list!<cr>
map <leader>ev :tabnew ~/.vimrc<cr>
map <leader>sv :so ~/.vimrc<cr>
map <leader>r <C-W>r

" Opens a new tab with the current buffer's path Super useful when editing
" files in the same directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" fold HTML tag
map <leader>ft Vatzf

" UtliSnips trigger keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
