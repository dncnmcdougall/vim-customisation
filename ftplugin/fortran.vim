" Fortran
if exists("b:dmd_fortran_ftplugin")
    finish
endif
let b:dmd_fortran_ftplugin = 1

setlocal spell

let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_more_precise=1
let fortran_do_enddo=1
