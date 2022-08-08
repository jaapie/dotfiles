" ALE settings
"
autocmd ColorScheme *
    \ highlight ALEWarning term=undercurl cterm=undercurl ctermbg=NONE ctermfg=NONE guibg=NONE guibg=NONE gui=undercurl guisp=#66d9ef
autocmd ColorScheme *
    \ highlight ALEError term=undercurl cterm=undercurl ctermbg=NONE ctermfg=NONE guibg=NONE guibg=NONE gui=undercurl guisp=red

let g:ale_sign_error = "▶︎"
let g:ale_sign_warning = "▶︎"

let g:ale_linters = { 'ruby': ['rubocop'] }
