" Octave
if exists("b:dmd_octave_ftplugin")
    finish
endif
let b:dmd_octave_ftplugin = 1

setlocal spell spelllang=en_gb

if exists("+omnifunc")
    setlocal omnifunc=syntaxcomplete#Complete 
endif
