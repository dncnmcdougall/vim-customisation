if exists('g:threadhighlight_loaded')
  finish
endif
let g:threadhighlight_loaded = 1

function! s:FindThreadId()
    let l:lineNr = line('.')
    let l:start = getcurpos()

    let l:threadID = ''

    call setpos('.', [l:start[0], l:start[1], 1])
    let last = searchpos('^\d\+:', 'ce', lineNr)

    if last[1]
        let currLine = getline(lineNr)
        let l:threadID = strpart( currLine, 0, last[1])
    endif

    call setpos('.', start)
    return l:threadID
endfunction

function! s:HighlightCurrentThread()
    let l:threadID = s:FindThreadId()
    if l:threadID != ''
        let b:highlight_local_thread=1
        execute printf('match CursorColumn /^%s.*/', l:threadID)
        if v:hlsearch
            echom histget('search', -1)
            execute printf('2match Search /%s/', histget('search', -1) )
        else
            execute '2match'
        endif
    else
        execute 'match'
    endif
endfunction

function EnableHighlightThread()
    let l:bn = bufnr('%')
    execute 'augroup highlight_thread_buffer_' . l:bn
    execute '  autocmd!'
    execute '  autocmd CursorMoved <buffer=' . l:bn . '> call s:HighlightCurrentThread()'
    execute 'augroup end'
    call s:HighlightCurrentThread()
endfunction

function DisableHighlightThread()
    let l:bn = bufnr('%')
    execute 'augroup highlight_thread_buffer_' . l:bn
    execute '  autocmd!'
    execute 'augroup end'
    if exists('b:highlight_local_thread') && b:highlight_local_thread
        execute 'match'
        if !v:hlsearch
            execute '2match'
        endif
        let b:highlight_local_thread = 0
    endif
endfunction


    
