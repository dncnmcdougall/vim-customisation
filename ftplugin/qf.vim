" Quick Fix
if exists("b:dmd_quickfix_ftplugin")
    finish
endif
let b:dmd_quickfix_ftplugin = 1

function! RemoveQFItem() range
    let llinfo = getloclist(0,{'all':1})
    if empty(llinfo)
        let ccall = getqflist()
        call remove(ccall, a:firstline-1, a:lastline-1)
        call setqflist(ccall, 'r')
    else
        let llall = getloclist(0)
        call remove(llall, a:firstline-1, a:lastline-1)
        call setloclist(0, llall, 'r')
    endif

endfunction


:command! -range RemoveQFItem :<line1>,<line2>call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
map <buffer> dd :RemoveQFItem<cr>
vmap <buffer> d :RemoveQFItem<cr>
