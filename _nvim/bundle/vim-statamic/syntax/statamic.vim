" vim syntax file for statamic
" by jacob degeling
" me@jacobdegeling.com
" v0.1.0

" if !exists("main_syntax")
"   if version < 600
"     syntax clear
"   elseif exists("b:current_syntax")
"     finish
"   endif
"   let main_syntax = 'statamic'
" endif

" runtime! syntax/html.vim
" runtime! syntax/html/*.vim

syn case ignore

syn match statamicFunction '\w\+' contained
syn match statamicTagSeparator ':' contained nextgroup=statamicFunction

syn match statamicParameterEquals '=' contained nextgroup=statamicParameterValue
syn match statamicParameterValue '"[0-9a-z_]\+"' contained
syn match statamicParameter ' [a-z_]\+' contained nextgroup=statamicParameterEquals

syn keyword statamicTagName current_date entries get_content get_files member nav pages path redirect switch taxonomy theme transform nextgroup=statamicTagSeparator
syn keyword statamicTagName get get_post obfuscate pages post layout_content contained
syn match statamicTagName '{{\s*[a-z_]+' contained

syn keyword statamicConditional if endif else elseif

syn region statamicTag start='{{' end='}}' contains=statamicTagName,statamicTagSeparator,statamicFunction,statamicParameter,statamicParameterEquals,statamicParameterValue

hi def link statamicTag htmlTag
hi def link statamicTagName Keyword 
hi def link statamicFunction Function
hi def link statamicParameter htmlArg
hi def link statamicParameterValue htmlString


