if exists('g:loaded_project')
  finish
endif
let g:loaded_project = 1

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

let s:projectInfo = {}

call project#AddProjectInfo('default', {
            \   'fileCommand': 'find . -type f',
            \   'ctagsArgs': []
            \})


