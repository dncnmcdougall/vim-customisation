" markdown
if exists("b:dmd_markdown_ftplugin")
    finish
endif
let b:dmd_markdown_ftplugin = 1

setlocal textwidth=80
setlocal spell 

if v:lua.require('zettelkasten').contains(expand('%'))
    setlocal tagfunc=v:lua.zettelkasten.tagfunc
    setlocal isfname+=-,:
    setlocal iskeyword+=:,-
    setlocal suffixesadd+=.md
    setlocal keywordprg=:ZkHover
    setlocal completefunc=v:lua.zettelkasten.completefunc
endif
