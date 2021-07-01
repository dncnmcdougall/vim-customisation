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

let s:conda_lint_dir = expand('~').'/miniconda3/envs/lint/bin/'
let b:ale_fixers = ['black', 'trim_whitespace']
let b:ale_linters = ['mypy', 'jedils']
let b:ale_python_black_executable = s:conda_lint_dir.'black'
let b:ale_python_mypy_executable = s:conda_lint_dir.'mypy'
let b:ale_python_jedils_executable = s:conda_lint_dir.'jedi-language-server'

execute s:command
