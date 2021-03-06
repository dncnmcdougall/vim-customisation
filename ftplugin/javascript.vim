" JavaScript
if exists("b:dmd_javascript_ftplugin") 
    finish
endif
let b:dmd_javascript_ftplugin = 1

setlocal foldmethod=syntax 
setlocal spell

let g:javascript_fold = 1
let g:javascript_enable_domhtmlcss = 1

let b:ale_lint_on_insert_leave = 0
" let b:ale_lint_on_text_changed = 0

augroup fswitchAssosiations
    " Java Script
    au! BufEnter *.html let b:fswitchdst = 'jsx,js' | let b:fswitchlocs = './'
    au! BufEnter *.jsx let b:fswitchdst = 'js,html' | let b:fswitchlocs = './'
    au! BufEnter *.js let b:fswitchdst = 'html' | let b:fswitchlocs = './'
augroup END
