scriptencoding utf-8

"
" Highlight whitespace at end of line
"
" Highlight trailing whitespace in vim on non empty lines, but not while
" typing in insert mode!
" http://www.vimbits.com/bits/336
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\S\zs\s\+$/
au BufWinLeave * call clearmatches()
