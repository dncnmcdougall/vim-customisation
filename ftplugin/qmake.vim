" Qmake
if exists("b:dmd_qmake_ftplugin")
    finish
endif
let b:dmd_qmake_ftplugin = 1

setlocal commentstring=#\ %s

augroup fswitchAssosiations
    " Pro files
    au! BufEnter *.pro let b:fswitchdst = 'depends.pro' | let b:fswitchlocs = './' 
    au! BufEnter *.depends.pro let b:fswitchdst = 'pro' | let b:fswitchlocs = './' | let b:fswitchfnames = '/.depends$//'
augroup END
