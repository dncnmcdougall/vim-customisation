if exists('g:project_loaded')
  finish
endif
let g:project_loaded = 1
let g:cwd = getcwd()

function! project#ProjectRoot(file_path)
    if stridx(a:file_path,g:cwd) == 0
        return g:cwd
    else
        return a:file_path
    endif
endfunction

function! project#RelativeToRoot(file_path)
    if stridx(a:file_path,g:cwd) == 0
        return strpart(a:file_path, strlen(g:cwd)+1)
    else
        return a:file_path
    endif
endfunction

function! project#IsBelowRoot(file_path)
    if stridx(a:file_path,g:cwd) == 0
        return 1
    else
        return 0
    endif
endfunction

function! project#AddProjectInfo(type, info)
    let s:projectInfo[a:type] = a:info
endfunction

function! project#ProjectInfo(proj_root, proj_type)
    let l:info = get(s:projectInfo, a:proj_type, {})
    if empty(l:info)
        let l:info = get(s:projectInfo, 'default', {})
    endif
    return copy(l:info)
endfunction

function! project#ProjectFilesCommand(proj_root, proj_type)
    return project#ProjectInfo(a:proj_root, a:proj_type)['fileCommand']
endfunction

function! project#ProjectCTagsExtraArgs(proj_root, proj_type)
    return project#ProjectInfo(a:proj_root, a:proj_type)['ctagsArgs']
endfunction

function! project#CreateFindFromExtensions(extensions)
    let l:parts = []
    for ext in a:extensions 
        call add(l:parts,'-name "*.'.ext.'"')
    endfor
    
    return 'find . '.join(l:parts, ' -o ')
endfunction

function! project#CreateAgGFromExtensions(extensions)
    let l:parts = []
    for ext in a:extensions 
        call add(l:parts,'(.*\.'.ext.'$)')
    endfor
    
    return "-G '".join(l:parts, '|')."'"
endfunction

function! project#CreateGrepFromExtensions(extensions)
    let l:parts = []
    for ext in a:extensions 
        call add(l:parts,'--include "*.'.ext.'"')
    endfor
    
    return join(l:parts, ' ')
endfunction

let s:projectInfo = {}

call project#AddProjectInfo('default', {
            \   'fileCommand': 'find . -type f',
            \   'ctagsArgs': [],
            \   'fileExtentions': []
            \})


