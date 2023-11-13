" ALE settings
"
let g:ale_set_highlights = 1
let g:ale_set_signs  = 0

autocmd ColorScheme *
    \ highlight ALEWarning term=undercurl cterm=undercurl ctermbg=NONE ctermfg=NONE guibg=NONE gui=undercurl guisp=#66d9ef
autocmd ColorScheme *
    \ highlight ALEVirtualTextWarning term=undercurl cterm=undercurl ctermbg=NONE ctermfg=NONE guifg=#75715e
autocmd ColorScheme *
    \ highlight ALEVirtualTextError term=undercurl cterm=undercurl ctermbg=NONE ctermfg=NONE guibg=NONE guibg=NONE gui=undercurl guisp=red

let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"

let g:ale_linters = { 'ruby': ['rubocop'] }
