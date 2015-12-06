set nocompatible

let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_include_dirs = [ '/usr/local/include' ]
let g:syntastic_html_tidy_exec = "tidy5"

" let pathogen do its thing
execute pathogen#infect()
execute pathogen#helptags()

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:neocomplcache_enable_at_startup = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme = 'pencil'
let g:airline_left_sep=''
let g:airline_right_sep=''

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

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab " Enable smart tabs
set autoread " automatically read buffer when changed outside vim
set smartindent

if exists('+colorcolumn')
    set colorcolumn=80
endif
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2
    syntax on
    colorscheme default
    set background=light
endif

if &t_Co == 256
    set background=light
    colorscheme pencil
endif

if has("gui_running")
    set background=light
    color pencil
    set guifont=Source\ Code\ Pro:h14
endif

set laststatus=2

" if &term !~ 'linux'
" else
"     if has('statusline')

"     endif
" endif

" +++++++++++++++++++++++
" File type stuff
" +++++++++++++++++++++++

" Enable file type detection.
filetype plugin indent on
au BufRead,BufNewFile *.scss    set filetype=scss

"Enable OmniComplete on different filetypes
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal formatoptions-=t
autocmd FileType yaml setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType python setlocal sw=2 ts=2 sts=2 expandtab

" set correct commentstring for files
autocmd FileType apache set comments=:# commentstring=#\ %s
autocmd FileType php set commentstring=//\ %s

" change keywordprg for php files to pman
autocmd FileType php set keywordprg=pman

" Automatically source ~/.vimrc when the file changes
autocmd! BufWritePost ~/dev/dotfiles/_vimrc source ~/.vimrc
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

au BufRead,BufNewFile /usr/local/etc/nginx/conf.d/*,/usr/local/etc/nginx/sites-*/* if &ft == '' | setfiletype nginx | endif

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

" ++++++++++++++++++++++++++
" Backup, Swap, and Undo Files
" ++++++++++++++++++++++++++

" Set directory for backup and swap files
" silent !mkdir /tmp/vim > /dev/null 2>&1

" set dir=/tmp/vim
" set backupdir=/tmp/vim

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir /tmp/vim/backups > /dev/null 2>&1
set undodir=/tmp/vim/backups
set undofile

set nobackup
set noswapfile

" ===========================
" set relative numbers in current window, absolute in others
" http://jeetworks.org/from-acolyte-to-adept-the-next-step-after-nop-ing-arrow-keys
" ===========================
if has('autocmd')
augroup vimrc_linenumbering
    autocmd!
    autocmd WinLeave *
                \ if &number |
                \   set norelativenumber |
                \ endif
    autocmd BufWinEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
    autocmd VimEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
augroup END
endif

" +++++++++++++++++++++++++++
" Change cursor to vertical bar when running in iTerm2.app
" +++++++++++++++++++++++++++
" change cursor to vertical bar in insert mode when using iTerm2
if $TERM_PROGRAM == 'iTerm.app'
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif

" =====================
" Window functionality
" =====================

set splitright
set splitbelow

" =====================
" Highlight whitespace at end of line
" =====================
" Highlight trailing whitespace in vim on non empty lines, but not while
" typing in insert mode!
" http://www.vimbits.com/bits/336
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
au BufWinLeave * call clearmatches()

" =====================
" Key mappings
" =====================

let mapleader=","
runtime macros/matchit.vim

" Session management
" Quick write session with F6
nmap <silent><F6> :mksession! ~/.vim_session <CR> 
" And load session with F7--like Quake quick save
nmap <silent><F7> :source ~/.vim_session <CR>     

" F2 to save
nmap <F2> :w!<CR>
imap <F2> <ESC>:w!<CR> i

" F5 toggles line wrapping 
nmap <silent><F5> :set wrap!<CR>
imap <silent><F5> <ESC>:set wrap!<CR>

" <F3> clear last search result
nnoremap <silent><F3> :nohlsearch<CR>

" add lines above and below
nnoremap + maO<esc>`a
nnoremap - mao<esc>`a

" Yank to the OS clipboard with ,y
vnoremap <leader>y "*y
nnoremap <leader>Y "*yy

" Yank to end of line
nnoremap Y y$

" Make regex sane: search with perl regular expressions
nnoremap / /\v
vnoremap / /\v

" better moving through long lines that are wrapped
nnoremap j gj
nnoremap k gk

imap <silent> <leader>zc <C-y>,
nmap <silent> <leader>zc <C-y>,
map <leader>pc "*p
map <silent><leader>i :set list!<cr>
map <leader>ev :tabnew ~/.vimrc<cr>
map <leader>r <C-W>r
map <leader>wh <C-W>H
map <leader>wv <C-W>L

" Duplicate current line below
inoremap <leader>ll <esc>mayyp`a i
nnoremap <leader>ll mayyp`a

" insert a line above and below
imap <leader>f <esc>+- i
nmap <leader>f +-

" switch between php and html filetypes
imap <leader>pp <esc>:set ft=php<cr> i
nmap <leader>pp :set ft=php<cr>
imap <leader>ph <esc>:set ft=html<cr> i
nmap <leader>ph :set ft=html<cr>

inoremap jk <esc>

inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O
inoremap <leader>A <ESC>A

" Opens a new tab with the current buffer's path Super useful when editing
" files in the same directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>ve :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>he :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>tn :tabnew<cr>

" fold HTML tag
map <leader>ft Vatzf

" UtliSnips trigger keys
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" fugitive plugin commands
inoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gs :Gstatus<CR>
inoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gc :Gcommit<CR>
inoremap <leader>gl :Glog<CR>
nnoremap <leader>gl :Glog<CR>
" inoremap <leader>ga :Git add %
" nnoremap <leader>ga :Git add %
" inoremap <leader>gt :Git add .
" nnoremap <leader>gt :Git add .

" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <M-Tab> <c-x><c-o>
" inoremap <C-Tab> <c-x><c-f>

" source various files
source $VIMRUNTIME/ftplugin/man.vim

" map Q to repeat last macro
map Q @@

" from https://github.com/eiro/rcfiles/
 
inoremap "" ""<left>
inoremap '' ''<left>
 
inoremap (( ()<left>
inoremap (<cr> (<cr>)<c-o>O

inoremap (; ();<esc>hi
inoremap (<cr>; (<cr>);<c-o>O
inoremap ('; ('');<esc>hhi
inoremap ("; ("");<esc>hhi
inoremap (' ('')<esc>hi
inoremap (" ("")<esc>hi
 
inoremap {{ {}<left>
inoremap {<cr> {<cr>}<c-o>O
inoremap {; {};<esc>hi
inoremap {, {},<esc>hi
inoremap {<cr>; {<cr>};<c-o>O
inoremap {<cr>, {<cr>},<c-o>O
inoremap {'; {''};<esc>hhi
inoremap {"; {""};<esc>hhi
inoremap {' {''}<esc>hi
inoremap {" {""}<esc>hi
 
inoremap [[ []<left>
inoremap [<cr> [<cr>]<c-o>O
inoremap [; [];<esc>hi
inoremap [<cr>; [<cr>];<c-o>O
inoremap ['; [''];<esc>hhi
inoremap ["; [""];<esc>hhi
inoremap [' ['']<esc>hi
inoremap [" [""]<esc>hi

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nmap <F1> <ESC>
imap <F1> <ESC>
