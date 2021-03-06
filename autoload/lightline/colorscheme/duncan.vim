
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}

let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle =[ [ 'gray7', 'gray2' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let s:p.inactive.right = [ ['gray10', 'gray2'], ['gray9', 'gray4'] ]
let s:p.inactive.left = [ ['white', 'gray2'], ['white', 'gray4'] ]
let s:p.inactive.middle =[ [ 'gray2', 'gray7' ] ]

let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]

let s:p.terminal = copy( s:p.insert )

let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]

let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.replace.right = s:p.normal.right
let s:p.replace.middle = s:p.normal.middle

let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]

let g:lightline#colorscheme#duncan#palette = lightline#colorscheme#fill(s:p)
