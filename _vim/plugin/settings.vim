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
set formatoptions=cqrj
set tw=118
set number
set cursorline
set modeline
set timeout timeoutlen=500 ttimeoutlen=100
set scrolloff=2
set hidden
set incsearch

if !has('nvim')
    " augroup vimrc-incsearch-highlight
    "     autocmd!
    "     autocmd CmdlineEnter /,\? :set hlsearch
    "     autocmd CmdlineLeave /,\? :set nohlsearch
    " augroup END
else
    set inccommand=nosplit
endif

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
    set colorcolumn=120
endif

if has('mouse')
    set mouse=a
    if !has('gui_running')

        " for some reason, doing this directly with 'set ttymouse=xterm2'
        " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse makes
        " tmux enter copy mode instead of selecting or scrolling inside Vim --
        " but luckily, setting it up from within autocmds works

        if !has('nvim')
            autocmd VimEnter * set ttymouse=xterm2
            autocmd FocusGained * set ttymouse=xterm2
            autocmd BufEnter * set ttymouse=xterm2
        endif
    endif
endif

" merci wincent
" if exists('$SUDO_USER')
    set nobackup                        " don't create root-owned files
    set nowritebackup                   " don't create root-owned files
" else
"     if !has('nvim')
"         set backupdir=~/.local/state/vim/backup//
"     else
"         set backupdir=~/.local/state/nvim/backup//
"     endif
"     " set backupdir-=.
" endif

" if exists('$SUDO_USER')
    set noswapfile                      " don't create root-owned files
" else
"     if !has('nvim')
"         set directory=~/.local/state/vim/swap//
"     else
"         set directory=~/.local/state/nvim/swap//
"     endif
"     " set directory-=.
" endif

if has('persistent_undo')
    if exists('$SUDO_USER')
        set noundofile                    " don't create root-owned files
    else
        " set undodir=~/local/.vim/tmp/undo
        if !has('nvim')
            set undodir=~/.local/state/vim/undo//
        else
            set undodir=~/.local/state/nvim/undo//
        endif
        " set undodir-=.
        set undofile                      " actually use undo files
    endif
endif

set splitright
set splitbelow

if has('linebreak')
    let &showbreak='↳ '
    set linebreak wrap nolist
    set breakat+= 
    set breakindent
endif

" diff options
set diffopt+=algorithm:patience
