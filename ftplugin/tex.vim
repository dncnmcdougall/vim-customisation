" latex
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "pdflatex -interaction=nonstopmode $*"
let g:Tex_ViewRule_pdf = "zathura"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_Env_frame="\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"

