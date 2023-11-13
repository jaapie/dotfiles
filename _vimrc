scriptencoding utf-8
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'jakar/vim-json'
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'
Plug 'mechatroner/rainbow_csv'
Plug 'pangloss/vim-javascript'
Plug 'tmux-plugins/vim-tmux'
Plug 'jeremiahkellick/vim-textobj-rubyblock'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'wincent/command-t'
Plug 'wincent/ferret'
Plug 'wincent/pinnacle'
Plug 'itmammoth/doorboy.vim'
Plug '~/.vim/plugins/colorschemes'
Plug 'thoughtbot/vim-rspec'

call plug#end()

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has("termguicolors")
    set termguicolors

    " Don't need this in xterm-256color, but do need it inside tmux.
    " (See `:h xterm-true-color`.)
    if &term =~# 'screen-256color' || &term =~# 'tmux-256color'
        let &t_8f="\e[38;2;%lu;%lu;%lum"
        let &t_8b="\e[48;2;%lu;%lu;%lum"
    endif
endif

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

if &t_Co == 256
    let base16colorspace=256
    set background=dark
    colorscheme base16-monokai
endif

if has("gui_running")
    set background=dark
    color base16-monokai

    if has("gui_gnome")
        set guifont=Source\ Code\ Pro\ 10
    else
        set guifont=Source\ Code\ Pro\ Light:h12
    endif
endif

if has('nvim')
    let g:CommandTPreferredImplementation='lua'

    noremap <C-p> :CommandT<cr>
    noremap <C-b> :CommandTBuffer<cr>
endif

" File type stuff

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
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

au BufRead,BufNewFile /usr/local/etc/nginx/conf.d/*,/usr/local/etc/nginx/sites-*/* if &ft == '' | setfiletype nginx | endif

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

au InsertEnter *.html setlocal iskeyword+=-
au InsertEnter *.html setlocal iskeyword+=-
au InsertLeave *.scss setlocal iskeyword-=-
au InsertLeave *.scss setlocal iskeyword-=-
au InsertEnter *.css setlocal iskeyword+=-
au InsertLeave *.css setlocal iskeyword-=-

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.  Only define it when not
" defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"
" Key mappings
"

let mapleader=","
" runtime macros/matchit.vim
packadd! matchit

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
" nnoremap / /\v
" vnoremap / /

" better moving through long lines that are wrapped
nnoremap j gj
nnoremap k gk

" imap <silent> <leader>zc <C-y>,
nmap <silent> <leader>zc <C-y>,
map <leader>pc "*p
map <silent><leader>i :set list!<cr>
map <leader>ev :tabnew ~/.vimrc<cr>
map <leader>r <C-W>r
map <leader>wh <C-W>H
map <leader>wv <C-W>L

map <C-W>\| :vsplit<cr>
map <C-W>- :split<cr>

" Duplicate current line below
" inoremap <leader>ll <esc>mayyp`a i
nnoremap <leader>ll mayyp`a

" insert a line above and below
" imap <leader>f <esc>+- i
nmap <leader>f +-

" switch between php and html filetypes
" imap <leader>pp <esc>:set ft=php<cr> i
nmap <leader>pp :set ft=php<cr>
" imap <leader>ph <esc>:set ft=html<cr> i
nmap <leader>ph :set ft=html<cr>

" inoremap jk <esc>

" inoremap <leader>o <ESC>o
" inoremap <leader>O <ESC>O
" inoremap <leader>A <ESC>A

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
" inoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gs :Gstatus<CR>
" inoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gc :Gcommit<CR>
" inoremap <leader>gl :Glog<CR>
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

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
