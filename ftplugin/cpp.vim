" Cpp
if exists("b:dmd_cpp_ftplugin")
    finish
endif
let b:dmd_cpp_ftplugin = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 0
let g:cpp_experimental_template_highlight = 1

setlocal commentstring=//\ %s
setlocal cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l1,b0,g0,hs,N-s,ps,ts,is,+s,c3,C0,/0,(0,us,U0,w1,Ws,k0,m0,j1,J0,)20,*70,#0
setlocal cindent

augroup fswitchAssosiations
    " Cpp
    au! BufEnter *.h          let b:fswitchdst = 'hxx,hpp,cpp,_Expand.cpp,test.cpp' | let b:fswitchlocs = 'reg:|include.*|src/**|,reg:|include.*|test/src/**|'
    au! BufEnter *.hxx        let b:fswitchdst = 'hpp,cpp,_Expand.cpp,test.cpp,h'   | let b:fswitchlocs = 'reg:|include.*|src/**|,reg:|include.*|test/src/**|'
    au! BufEnter *.hpp        let b:fswitchdst = 'cpp,_Expand.cpp,test.cpp,h'       | let b:fswitchlocs = 'reg:|include.*|src/**|,reg:|include.*|test/src/**|'
    au! BufEnter *.cpp        let b:fswitchdst = '_Expand.cpp,test.cpp,h'           | let b:fswitchlocs = 'reg:|src.*|src|,reg:|src.*|test/src/**|,reg:|src.*|include/**|'
    au! BufEnter *_Expand.cpp let b:fswitchdst = 'test.cpp,h'                       | let b:fswitchlocs = 'reg:|src.*|test/src/**|,reg:|src.*|include/**|'                  | let b:fswitchfnames = '/_Expand$//'
    au! BufEnter *.test.cpp   let b:fswitchdst = 'h'                                | let b:fswitchlocs = 'reg:|test/src.*|include/**|'                                     | let b:fswitchfnames = '/.test$//'
augroup END

" lldb
function! SetBreakPoint(...)
    let brk_pt = "b -f ". expand("%:p")." -l ".line(".")
    if a:0
        exe 'let @'.a:1.' = '.bkt_pt
    else
        let @" = ''.brk_pt
    endif
endfunction

command! -register Lb call SetBreakPoint(<reg>)
