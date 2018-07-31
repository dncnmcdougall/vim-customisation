" Python
if exists("b:dmd_python_ftplugin")
    finish
endif
let b:dmd_python_ftplugin = 1

let s:additional_options=""
if exists("g:pylint_rc")
    let s:additional_options="--rcfile=".g:pylint_rc
endif

let s:command = "setlocal makeprg=".escape("pylint --reports=n --output-format=parseable ".s:additional_options." %:p", ' \')

execute s:command
setlocal errorformat=%f:%l:\ %m
