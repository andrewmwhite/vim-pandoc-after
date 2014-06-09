function! pandoc#after#supertab#Init()
    if exists("g:SuperTabDefaultCompletionType")
	call SuperTabSetDefaultCompletionType("context")

	if exists('g:SuperTabCompletionContexts')
	    if exists('g:pandoc#modules#enabled') && index(g:pandoc#modules#enabled, "completion") != -1
		let b:SuperTabCompletionContexts =
			    \ ['pandoc#after#supertab#Context'] + g:SuperTabCompletionContexts
	    endif
	endif

	" disable supertab completions after bullets and numbered list
	" items (since one commonly types something like `+<tab>` to
	" create a list.)
	" retains global disable patterns
	let b:SuperTabNoCompleteAfter = g:SuperTabNoCompleteAfter +
		\ ['\s', '^\s*\(-\|\*\|+\|>\|:\)', '^\s*(\=\d\+\(\.\=\|)\=\)']

	" remove any duplicates
	call sort(b:SuperTabNoCompleteAfter)
	call uniq(b:SuperTabNoCompleteAfter)
endif

function! pandoc#after#supertab#Context()
    return "\<c-x>\<c-o>"
endfunction
