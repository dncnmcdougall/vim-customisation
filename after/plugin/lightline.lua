
-- lightline
vim.g.lightline = {
    colorscheme = 'duncan',
    active = {
        left = { {'projectroot'}, 
            {'filename'},
            {'readonly', 'modified'} },
        right = { { 'truncate', 'lineinfo', 'gitbranch' },
            { 'percent' },
            { 'filetype', 'currenttag' } } 
    },
    inactive = {
        left = { {'projectroot'}, 
            {'filename'},
            {'readonly', 'modified'} },
        right = { { 'truncate', 'lineinfo', 'gitbranch' },
            { 'percent' } } 
    },
    component= {
        truncate = '%<'
    },
    component_function = {
        projectroot = 'ProjectRoot',
        currenttag = 'CurrentTag',
        gitbranch = 'fugitive#head',
    },
    component_visible_condition = {
        truncate = '0',
        relativepath = 'winwidth(0)>60',
    }
}

function FullProjectRoot()
    if (vim.bo.ft == 'fzf' or vim.bo.ft == 'term') then
        return vim.fn['project#ProjectRoot'](vim.fn.getcwd())
    else
        return vim.fn['project#ProjectRoot'](vim.fn.expand('%:p:h'))
    end
end

vim.cmd([[
function! ProjectRoot()
return fnamemodify(luaeval('FullProjectRoot()'),':t')
endfunction
]])

