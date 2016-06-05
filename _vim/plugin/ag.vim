scriptencoding utf-8

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

	let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif
