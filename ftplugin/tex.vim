" latex
if exists("b:dmd_tex_ftplugin")
    finish
endif
let b:dmd_tex_ftplugin = 1

setlocal tw=80
setlocal spell spelllang=en_gb

let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "pdflatex -interaction=nonstopmode $*"
let g:Tex_ViewRule_pdf = "zathura"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_Env_frame="\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"
let g:Tex_PackageMenu = 0 " This is a workaround for the bug where it sets the filetype in a different split.


