" Vim color file
" Maintaner: Radu Dineiu <radu.dineiu@gmail.com>
" URL: http://ld.yi.org/vim/rdark/
" Last Change: 2007 Jun 23
" Version: 0.6
"
" Features:
"   - let rdark_current_line = 1 if you want to highlight the current line
"
" Changelog:
"   0.5 - fixed the Pmenu colors
"   0.6 - added SignColumn colors

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "rdark"

" Current Line
if exists('rdark_current_line') && rdark_current_line == 1
	set cursorline
	hi CursorLine guibg=#191f21 ctermbg=234
endif

" Default Colors
hi Normal guifg=#babdb6 ctermfg=250 guibg=#1e2426 ctermbg=235
hi NonText guifg=#2c3032 ctermfg=236 guibg=#2c3032 ctermbg=236 gui=none
hi Cursor guibg=#babdb6 ctermbg=250
hi ICursor guibg=#babdb6 ctermbg=250

" Search
hi Search guifg=#2e3436 ctermfg=236 guibg=#fcaf3e ctermbg=215
hi IncSearch guibg=#2e3436 ctermbg=236 guifg=#fcaf3e ctermfg=215

" Window Elements
hi StatusLine guifg=#2e3436 ctermfg=236 guibg=#babdb6 ctermbg=250 gui=none
hi StatusLineNC guifg=#2e3436 ctermfg=236 guibg=#888a85 ctermbg=102 gui=none
hi VertSplit guifg=#555753 ctermfg=240 guibg=#888a85 ctermbg=102 gui=none
hi Visual guifg=#1e2426 ctermfg=235 guibg=#EC008C ctermbg=198
hi MoreMsg guifg=#729fcf ctermfg=74
hi Question guifg=#8ae234 ctermfg=113 gui=none
hi WildMenu guifg=#eeeeec ctermfg=7 guibg=#0e1416 ctermbg=233
hi LineNr guifg=#3f4b4d ctermfg=238 guibg=#000000 ctermbg=0
hi SignColumn guibg=#1e2426 ctermbg=235

" Pmenu
hi Pmenu guibg=#2e3436 ctermbg=236 guifg=#eeeeec ctermfg=7
hi PmenuSel guibg=#ffffff ctermbg=15 guifg=#1e2426 ctermfg=235
hi PmenuSbar guibg=#555753 ctermbg=240
hi PmenuThumb guifg=#ffffff ctermfg=15

" Diff
hi DiffDelete guifg=#2e3436 ctermfg=236 guibg=#0e1416 ctermbg=233
hi DiffAdd guibg=#1f2b2d ctermbg=235
hi DiffChange guibg=#2e3436 ctermbg=236
hi DiffText guibg=#000000 ctermbg=0 gui=none

" Folds
hi Folded guifg=#d3d7cf ctermfg=252 guibg=#204a87 ctermbg=24
hi FoldColumn guifg=#3465a4 ctermfg=61 guibg=#000000 ctermbg=0

" Specials
hi Title guifg=#fcaf3e ctermfg=215
hi Todo guifg=#fcaf3e ctermfg=215 guibg=bg
hi SpecialKey guifg=#ef2929 ctermfg=9

" Tabs
hi TabLine guibg=#0a1012 ctermbg=233 guifg=#888a85 ctermfg=102
hi TabLineFill guifg=#0a1012 ctermfg=233
hi TabLineSel guibg=#555753 ctermbg=240 guifg=#eeeeec ctermfg=7 gui=none

" Matches
hi MatchParen guifg=#2e3436 ctermfg=236 guibg=#fcaf3e ctermbg=215

" Tree
hi Directory guifg=#ffffff ctermfg=15

" Syntax
hi Comment guifg=#656763 ctermfg=241 gui=italic
hi Constant guifg=#8ae234 ctermfg=113
hi Number guifg=#8ae234 ctermfg=113
hi Statement guifg=#729fcf ctermfg=74 gui=none
hi Identifier guifg=#ffffff ctermfg=15
hi PreProc guifg=#fcaf3e ctermfg=215
hi Function guifg=#fcaf3e ctermfg=215
hi Type guifg=#e3e7df ctermfg=7 gui=none
hi Keyword guifg=#eeeeec ctermfg=7
hi Special guifg=#888a85 ctermfg=102
hi Error guifg=#eeeeec ctermfg=7 guibg=#cc0000 ctermbg=1

" PHP
hi phpRegionDelimiter guifg=#ad7fa8 ctermfg=139
hi phpPropertySelector guifg=#888a85 ctermfg=102
hi phpPropertySelectorInString guifg=#888a85 ctermfg=102
hi phpOperator guifg=#888a85 ctermfg=102
hi phpArrayPair guifg=#888a85 ctermfg=102
hi phpAssignByRef guifg=#888a85 ctermfg=102
hi phpRelation guifg=#888a85 ctermfg=102
hi phpMemberSelector guifg=#888a85 ctermfg=102
hi phpUnknownSelector guifg=#888a85 ctermfg=102
hi phpVarSelector guifg=#babdb6 ctermfg=250
hi phpSemicolon guifg=#888a85 ctermfg=102 gui=none
hi phpFunctions guifg=#d3d7cf ctermfg=252
hi phpParent guifg=#888a85 ctermfg=102

" JavaScript
hi javaScriptBraces guifg=#888a85 ctermfg=102
hi javaScriptOperator guifg=#888a85 ctermfg=102

" HTML
hi htmlTag guifg=#888a85 ctermfg=102
hi htmlEndTag guifg=#888a85 ctermfg=102
hi htmlTagName guifg=#babdb6 ctermfg=250
hi htmlSpecialTagName guifg=#babdb6 ctermfg=250
hi htmlArg guifg=#d3d7cf ctermfg=252
hi htmlTitle guifg=#8ae234 ctermfg=113 gui=none
hi link htmlH1 htmlTitle
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1

" XML
hi link xmlTag htmlTag
hi link xmlEndTag htmlEndTag
hi link xmlAttrib htmlArg

" CSS
hi cssSelectorOp guifg=#eeeeec ctermfg=7
hi link cssSelectorOp2 cssSelectorOp
hi cssUIProp guifg=#d3d7cf ctermfg=252
hi link cssPagingProp cssUIProp
hi link cssGeneratedContentProp cssUIProp
hi link cssRenderProp cssUIProp
hi link cssBoxProp cssUIProp
hi link cssTextProp cssUIProp
hi link cssColorProp cssUIProp
hi link cssFontProp cssUIProp
hi cssPseudoClassId guifg=#eeeeec ctermfg=7
hi cssBraces guifg=#888a85 ctermfg=102
hi cssIdentifier guifg=#fcaf3e ctermfg=215
hi cssTagName guifg=#fcaf3e ctermfg=215
hi link cssInclude Function
hi link cssCommonAttr Constant
hi link cssUIAttr Constant
hi link cssTableAttr Constant
hi link cssPagingAttr Constant
hi link cssGeneratedContentAttr Constant
hi link cssAuralAttr Constant
hi link cssRenderAttr Constant
hi link cssBoxAttr Constant
hi link cssTextAttr Constant
hi link cssColorAttr Constant
hi link cssFontAttr Constant
