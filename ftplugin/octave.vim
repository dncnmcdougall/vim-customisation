" Octave
if exists("b:dmd_octave_ftplugin")
    finish
endif
let b:dmd_octave_ftplugin = 1

setlocal spell 

if exists("+omnifunc")
    setlocal omnifunc=syntaxcomplete#Complete 
endif
