" JavaScript
if exists("b:dmd_javascript_ftplugin")
    finish
endif
let b:dmd_javascript_ftplugin = 1

javascript setlocal foldmethod=syntax 
let g:javascript_fold = 1
let g:javascript_enable_domhtmlcss = 1

augroup fswitchAssosiations
    " Java Script
    au! BufEnter *.html let b:fswitchdst = 'jsx,js' | let b:fswitchlocs = './'
    au! BufEnter *.jsx let b:fswitchdst = 'js,html' | let b:fswitchlocs = './'
    au! BufEnter *.js let b:fswitchdst = 'html' | let b:fswitchlocs = './'
augroup END
