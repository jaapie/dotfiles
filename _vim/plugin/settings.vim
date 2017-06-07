scriptencoding utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=500 " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set hlsearch
set incsearch   " do incremental searching
set smartcase
set encoding=utf8
set whichwrap+=<,>,h,l
set magic
set mat=2
set noerrorbells
set novisualbell
set pastetoggle=<F4>
set nowrap
set nolist listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set foldmethod=manual
set formatoptions=tcqrj
set tw=78
set number
set cursorline
set modeline
set timeout timeoutlen=500 ttimeoutlen=100
set scrolloff=2
set hidden

set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab " Enable smart tabs
set autoread " automatically read buffer when changed outside vim
set smartindent
set laststatus=2

"
" Enable file type detection.
filetype plugin indent on
syntax on

if exists('+colorcolumn')
    set colorcolumn=80
endif

if has('mouse')
    set mouse=a
    if !has('gui_running')

        " for some reason, doing this directly with 'set ttymouse=xterm2'
        " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse makes
        " tmux enter copy mode instead of selecting or scrolling inside Vim --
        " but luckily, setting it up from within autocmds works

        autocmd VimEnter * set ttymouse=xterm2
        autocmd FocusGained * set ttymouse=xterm2
        autocmd BufEnter * set ttymouse=xterm2
    endif
endif

" merci wincent
if exists('$SUDO_USER')
	set nobackup                        " don't create root-owned files
	set nowritebackup                   " don't create root-owned files
else
	set backupdir=~/local/.vim/tmp/backup
	set backupdir+=~/.vim/tmp/backup    " keep backup files out of the way
	set backupdir+=.
endif

if exists('$SUDO_USER')
	set noswapfile                      " don't create root-owned files
else
	set directory=~/local/.vim/tmp/swap//
	set directory+=~/.vim/tmp/swap//    " keep swap files out of the way
	set directory+=.
endif

if has('persistent_undo')
	if exists('$SUDO_USER')
		set noundofile                    " don't create root-owned files
	else
		set undodir=~/local/.vim/tmp/undo
		set undodir+=~/.vim/tmp/undo      " keep undo files out of the way
		set undodir+=.
		set undofile                      " actually use undo files
	endif
endif

set splitright
set splitbelow
