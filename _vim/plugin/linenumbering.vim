scriptencoding utf-8

"
" set relative numbers in current window, absolute in others
" originally from:
" http://jeetworks.org/from-acolyte-to-adept-the-next-step-after-nop-ing-arrow-keys
"
if has('autocmd')
augroup vimrc_linenumbering
    autocmd!
    autocmd BufEnter * :setlocal number relativenumber
    autocmd WinEnter * :setlocal number relativenumber
    autocmd BufLeave * :setlocal norelativenumber
    autocmd WinLeave * :setlocal norelativenumber
augroup END
endif

