" Python
if exists("b:dmd_python_ftplugin")
    finish
endif
let b:dmd_python_ftplugin = 1

setlocal errorformat=%f:%l:\ %m
setlocal spell 
setlocal foldmethod=indent

let s:additional_options=""
if exists("g:pylint_rc")
    let s:additional_options="--rcfile=".g:pylint_rc
endif

let s:command = "setlocal makeprg=".escape("pylint --reports=n --output-format=parseable ".s:additional_options." %:p", ' \')

execute s:command
