" Vim plugin for switching between .h/.hpp and .c/.cpp files
" Inspired by: http://vim.sourceforge.net/tips/tip.php?tip_id=384
" Maintainer: Slavomir Smutny <slavos1@gmail.com>
" Version: 1.2
" Last Change: 2006 August 31

"don't load twice, we don't like that...
if exists("loaded_switch_headers")
    finish
endif
let loaded_switch_headers = 1

"save current 'compatible' state and make vim compatible
let cpo_save = $cpo
set cpo&vim

" open header/source in new window
function! SwitchHeader()
	if &ft == 'c' || &ft == 'cpp'
		if expand('%:e') == 'h' || expand('%:e') == 'hpp'
			try | find %:t:r.c | catch /Can't find file/ | try | find %:t:r.cpp | catch | endtry | endtry
		else
			try | find %:t:r.h | catch /Can't find file/ | try | find %:t:r.hpp | catch | endtry | endtry
		endif
	endif
endfun

"return to previous 'compatibility' state
let &cpo = cpo_save

"vim:ts=2:sw=2:noexpandtab

