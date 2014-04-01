" Vim color file
" Maintaner: Jacob Degeling
" URL: jacobdegeling.com
" Last Change: 17-03-2014
" Version: v0.1.0
"

set background=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "friendly"

" Default Colors
hi Normal                                guifg=#5b5b5b ctermfg=240         guibg=#eeeeee ctermbg=255
hi NonText                               guifg=#b3b3b3 ctermfg=249         guibg=#dedede ctermbg=253 gui=none
hi Cursor                                                      guibg=#343434 ctermbg=236
hi ICursor                                                     guibg=#343434 ctermbg=236
"
" Syntax
hi Comment                               guifg=#408090 ctermfg=66 gui=italic
hi Constant                              guifg=#007020 ctermfg=22 gui=bold
hi String                                guifg=#4070A0 ctermfg=67
hi Character                             guifg=#4070A0 ctermfg=67
hi Number                                guifg=#208050 ctermfg=29
hi Statement                             guifg=#007020 ctermfg=22 gui=bold
hi Operator                              guifg=#666666 ctermfg=241
hi Identifier                            guifg=#007020 ctermfg=22 gui=bold
hi PreProc                               guifg=#007020 ctermfg=22
hi Function                              guifg=#06287e ctermfg=18
hi Type                                  guifg=#902000 ctermfg=88 gui=none
hi Keyword                               guifg=#007020 ctermfg=22 gui=bold
hi Special                               guifg=#5b5b5b ctermfg=240
hi SpecialChar                           guifg=#4070A0 ctermfg=67 gui=bold
hi Error                                 guifg=#eeeeec ctermfg=255         guibg=#cc0000 ctermbg=1
hi link Typedef Keyword
hi link StorageClass Keyword

" Search
hi Search                                guifg=#eeeeee ctermfg=255         guibg=#007020 ctermbg=22
hi IncSearch                             guifg=#eeeeee ctermfg=255         guibg=#007020 ctermbg=22
"
" Window Elements
hi StatusLine                            guifg=#b3b3b3 ctermfg=249         guibg=#dedede ctermbg=253 gui=none
hi StatusLineNC                          guifg=#b3b3b3 ctermfg=249         guibg=#dedede ctermbg=253 gui=none
hi VertSplit                             guifg=#b3b3b3 ctermfg=249         guibg=#888a85 ctermbg=102 gui=none
hi Visual                                guifg=#eeeeee ctermfg=255         guibg=#408090 ctermbg=66
hi MoreMsg                               guifg=#729fcf ctermfg=74
hi Question                              guifg=#fcaf3e ctermfg=215
hi WildMenu                              guifg=#eeeeec ctermfg=255         guibg=#0e1416 ctermbg=233
hi LineNr                                guifg=#b3b3b3 ctermfg=249         guibg=#dedede ctermbg=253
hi SignColumn                                                  guibg=#1e2426 ctermbg=235
"
" Spelling errors
" hi SpellBad
" hi SpellCap
"
" Pmenu
hi Pmenu                                 guifg=#eeeeee ctermfg=255         guibg=#5b5b5b ctermbg=240
hi PmenuSel                              guifg=#eeeeee ctermfg=255         guibg=#909090 ctermbg=246
hi PmenuSbar                                                   guibg=#555753 ctermbg=240
hi PmenuThumb                            guifg=#eeeeee ctermfg=255
"
" Diff
hi DiffDelete                            guifg=#2e3436 ctermfg=236         guibg=#0e1416 ctermbg=233
hi DiffAdd                                                     guibg=#1f2b2d ctermbg=235
hi DiffChange                                                  guibg=#2e3436 ctermbg=236
hi DiffText                                                    guibg=#000000 ctermbg=0 gui=none
"
" Folds
hi Folded                                guifg=#d3d7cf ctermfg=252         guibg=#204a87 ctermbg=24
hi FoldColumn                            guifg=#3465a4 ctermfg=67         guibg=#000000 ctermbg=0
"
" Specials
hi Title                                 guifg=#5b5b5b ctermfg=240 gui=none
hi Todo                                  guifg=#408090 ctermfg=66         guibg=#eeeeee ctermbg=255         gui=bold,italic
hi SpecialKey                            guifg=#ef2929 ctermfg=9 gui=bold
"
" Tabs
hi TabLine                               guifg=#888a85 ctermfg=102         guibg=#0a1012 ctermbg=233
hi TabLineFill                           guifg=#0a1012 ctermfg=233
hi TabLineSel                            guifg=#eeeeec ctermfg=255         guibg=#555753 ctermbg=240 gui=none
"
" Matches
hi MatchParen                            guifg=#eeeeee ctermfg=255         guibg=#a9a9a9 ctermbg=248
"
" Tree
hi Directory                             guifg=#ffffff ctermfg=15
"
" PHP
hi phpRegionDelimiter                    guifg=#ad7fa8 ctermfg=139
hi phpPropertySelector                   guifg=#5b5b5b ctermfg=240
hi phpPropertySelectorInString           guifg=#5b5b5b ctermfg=240
hi phpOperator                           guifg=#5b5b5b ctermfg=240
hi phpArrayPair                          guifg=#5b5b5b ctermfg=240
hi phpAssignByRef                        guifg=#5b5b5b ctermfg=240
hi phpRelation                           guifg=#5b5b5b ctermfg=240
hi phpMemberSelector                     guifg=#5b5b5b ctermfg=240
hi phpUnknownSelector                    guifg=#5b5b5b ctermfg=240
hi phpSemicolon                          guifg=#5b5b5b ctermfg=240 gui=none
hi phpFunctions                          guifg=#007020 ctermfg=22
hi phpParent                             guifg=#5b5b5b ctermfg=240
hi phpIdentifier                         guifg=#bb60D5 ctermfg=134
hi link phpVarSelector phpIdentifier
hi link phpType Keyword
hi link phpStorageClass Keyword
hi link phpStructure Keyword
"
" JavaScript
hi javaScriptBraces                      guifg=#5b5b5b ctermfg=240
hi javaScriptOperator                    guifg=#5b5b5b ctermfg=240
hi javaScriptDOMObjects                  guifg=#007020 ctermfg=22
hi javaScriptRegexpString                guifg=#235388 ctermfg=24
hi link javaScriptFuncKeyword Keyword
hi link javaScriptNull Keyword
hi link jQuery Normal
hi link javaScriptStringD String
hi link javaScriptStringS String
hi link jFunc Function
hi link jId String
hi link jBasicFilters String
"
" HTML
hi htmlTag                               guifg=#062873 ctermfg=17 gui=bold
hi htmlEndTag                            guifg=#062873 ctermfg=17 gui=bold
hi htmlTagName                           guifg=#062873 ctermfg=17 gui=bold
hi htmlSpecialTagName                    guifg=#062873 ctermfg=17 gui=bold
hi htmlArg                               guifg=#4070A0 ctermfg=67
hi link htmlLink Normal
hi link htmlH1 htmlTitle
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1
"
" XML
hi link xmlTag htmlTag
hi link xmlEndTag htmlEndTag
hi link xmlAttrib htmlArg
"
" CSS
hi link cssSelectorOp Normal
hi link cssProp Keyword
hi link cssUIProp cssProp
hi link cssAttr Keyword
hi cssBraces                             guifg=#5b5b5b ctermfg=240
hi cssIdentifier                         guifg=#fcaf3e ctermfg=215
hi cssTagName                            guifg=#0e84b5 ctermfg=31 gui=bold
hi cssClassName                          guifg=#0e84b5 ctermfg=31 gui=bold
hi link cssIdentifier cssClassName
hi link cssPseudoClassId cssClassName
hi link cssClassNameDot cssClassName
hi link cssAttrComma cssClassName
hi link cssSelectorOp2 cssSelectorOp
hi link cssInclude Function
"
" Java
hi link javaOperator Keyword
hi link javaStorageClass Keyword
hi link javaExternal Keyword

" VimL
hi link vimGroup Normal
hi link vimHiTerm Normal
hi link vimSpecial Normal
hi link vimSetSep Normal
hi link vimAutoEvent Normal
hi link vimVar Normal

" C
hi link cIncluded PreProc
hi link cStructure Keyword
