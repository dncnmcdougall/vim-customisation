" latex
if exists("b:dmd_tex_ftplugin")
    finish
endif
let b:dmd_tex_ftplugin = 1

let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "pdflatex -interaction=nonstopmode $*"
let g:Tex_ViewRule_pdf = "zathura"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_Env_frame="\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"

