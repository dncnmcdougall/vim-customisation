" latex
if exists("b:dmd_tex_ftplugin")
    finish
endif
let b:dmd_tex_ftplugin = 1

setlocal tw=80
setlocal spell 

let g:tex_flavor = "latex"

" vim-latex
" let g:Tex_DefaultTargetFormat = "pdf"
" let g:Tex_CompileRule_pdf = "pdflatex -interaction=nonstopmode $*"
" let g:Tex_ViewRule_pdf = "zathura"
" let g:Tex_MultipleCompileFormats = "pdf,dvi"
" let g:Tex_Env_frame="\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"
" let g:Tex_PackageMenu = 0 " This is a workaround for the bug where it sets the filetype in a different split.

" vimtex
let g:vimtex_compiler_enabled=0
let g:vimtex_include_search_enabled=0
let g:vimtex_view_enabled=0


