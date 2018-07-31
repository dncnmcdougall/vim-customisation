function! toggletoterm#ToggleToTerm()
    let l:previousWinNr = winnr()
    let l:previousTab = tabpagenr()

    if &ft == "term"
        let l:winNr = g:previousWinNr
        exe g:previousTab."tabnext"
        exe l:winNr."wincmd w"
    else
        let windows = getwininfo()

        let l:termWinNr = -1
        let l:termTab = -1

        for window in windows
            if getbufvar(window.bufnr, "&ft") =="term"
                let l:termWinNr = window.winnr
                let l:termTab = window.tabnr
            endif
        endfor

        if l:termWinNr != -1
            exe l:termTab."tabnext"
            exe l:termWinNr."wincmd w"
        endif
    endif

    let g:previousWinNr = l:previousWinNr
    let g:previousTab = l:previousTab
endfunction

function! toggletoterm#RecordWindow()
    let g:previousWinNr = winnr()
    let g:previousTab = tabpagenr()
endfunction

augroup termtoggle
    autocmd!
    autocmd! WinLeave * call toggletoterm#RecordWindow()
augroup END
