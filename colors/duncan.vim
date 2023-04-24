" Vim color file
" These are the colors of the "desert" theme by Henry So, Jr.
" which were colors of the "desert" theme by Hans Fugal with a few small
" modifications (namely that I lowered the intensity of the normal white and
" made the normal and nontext backgrounds black), modified to work with 88-
" and 256-color xterms.
"
" I (Duncan McDougall) have customised these to represent jGrasp

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="duncan"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun! <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun! <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun! <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun! <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun! <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun! <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun! <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun! <SID>rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    fun! <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun
    " }}}

    if &background == "dark"
        let contrast    ="e6e6e6"
        let contrastDull="dcc7a0"

        let base    ="000000"
        let baseDDull="444444"
        let baseDull="222222"

        let red     ="ff4040"
        let orange  ="fc7711"
        let yellow  ="fff555"
        let green   ="00cb00"
        let cyan    ="00afaf"
        let blue    ="40bfff"
        let magenta ="f73eee"
        let violet  ="a64dff"

        let blueDull    ="308fbf"
        let blueLight   ="99ddff"
        let greenDull   ="c0ffc0"
        let orangeDull  ="d4640e"
        let redDull     ="d75656"
        let violetDull  ="a299ff"
        let yellowDull  ="cd853f"

        let blueDark    ="252595"
        let cyanDark    ="258585"
        let greenDark   ="057505"
        let magentaDark ="852585"
        let redDark     ="952525"
        let yellowDark  ="858525"
    else
        let contrast    ="808080"
        let contrastDull="8a8a8a"

        let base    ="ffffe7"
        let baseDull="e5e5bf"
        let baseDDull="d7d7bf"

        let red     ="ff4040"
        let yellow  ="af8700"
        let orange  ="d75f00"
        let green   ="5dba00"
        let cyan    ="00afaf"
        let blue    ="0087ff"
        let magenta ="af005f"
        let violet  ="5f5faf"

        let redDull     ="ff6666"
        let redDark     ="bf3030"
        let yellowDull  ="cd853f"
        let greenDull   ="5f8700"
        let blueDull    ="40a5ff"
        let blueLight   ="99ddff"
        let violetDull  ="a299ff"

    endif


    call <SID>X("Normal", contrast, base, "")
    call <SID>X("NonText", contrast, base, "")
    call <SID>X("Bold", contrastDull, baseDull, "bold")
    call <SID>X("Italic", contrast, base, "italic")
    call <SID>X("BoldItalic", contrastDull, baseDull, "bold,italic")
    
    call <SID>X("htmlLink", blueDull, base, "")

    " highlight groups
    call <SID>X("Cursor", "", "", "reverse")
    call <SID>X("CursorNC", "", "", "")
    hi link TermCursor Cursor
    hi link TermCursorNC CursorNC
    "CursorLine
    "CursorIM
    "Directory
    call <SID>X("DiffAdd","",greenDark,"")
    call <SID>X("DiffChange","", blueDark,"")
    call <SID>X("DiffDelete","", redDark,"")
    call <SID>X("DiffText","",magentaDark,"")
    "ErrorMsg
    call <SID>X("VertSplit", contrast, contrast, "NONE")
    call <SID>X("Folded",contrast,baseDDull, "")
    call <SID>X("FoldColumn",contrast,baseDDull, "")
    call <SID>X("Search",contrastDull, yellowDull, "")
    call <SID>X("IncSearch",orangeDull, base, "")
    call <SID>X("LineNr", contrastDull, baseDDull,"")
    call <SID>X("ModeMsg",yellowDull, "", "")
    call <SID>X("MoreMsg",greenDull, "", "")
    call <SID>X("NonText",baseDull, base, "")
    call <SID>X("Question",green, "", "")
    call <SID>X("SpecialKey",green, "", "")
    " call <SID>X("StatusLine", "b2cfc5", base, "reverse")
    " call <SID>X("StatusLineNC", "c2bfa5", base, "reverse")
    call <SID>X("Title",redDull, "", "")
    call <SID>X("Visual", "",base, "reverse")
    "VisualNOS
    call <SID>X("WarningMsg",red, "", "")
    "WildMenu
    "Menu
    "Scrollbar
    "Tooltip

    hi link cFunctionTag Function
    hi link cTypeTag Function
    " syntax highlighting groups
    call <SID>X("Function", violetDull, "", "")
    call <SID>X("Comment", orange, "", "")
    call <SID>X("Constant", red, "", "")
    call <SID>X("String", green,"","")
    call <SID>X("Variable",contrast, "", "none")
    call <SID>X("Identifier",greenDull, "", "none")
    call <SID>X("Statement", violet, "", "bold")
    call <SID>X("PreProc", yellow, "", "")
    call <SID>X("Primitive", magenta, "", "none")
    call <SID>X("Type", blueLight, "", "none")
    call <SID>X("Namespace", blueLight, "", "")
    call <SID>X("Special", yellow, "", "")
    " hi link cCustomAngleBrackets cCustomClass
    call <SID>X("cCustomAngleBracketContent", greenDull, "", "")
    call <SID>X("cCustomAngleBrackets", greenDull, "", "bold")
    "Underlined
    call <SID>X("Ignore", baseDDull, "", "")
    "Error
    call <SID>X("Todo", red, yellow, "")
    call <SID>X("SpellBad", "", redDark, "")
    call <SID>X("SpellCap", "",blueDark, "")
    call <SID>X("SpellRare", "",magentaDark, "")
    call <SID>X("SpellLocal", "",cyanDark, "")

    " Indent guids
    call <SID>X("IndentGuidesOdd", "", base, "")
    call <SID>X("IndentGuidesEven", "",baseDull, "")

    " Color Column
    call <SID>X("ColorColumn", "", baseDull, "")

    "popup menu
    call <SID>X("PMenu", contrastDull, baseDull, "")
    call <SID>X("PMenuSel", baseDull,contrastDull, "")
    call <SID>X("PMenuSbar", contrastDull,baseDull, "")
    call <SID>X("PMenuThumb", baseDull,contrastDull, "")

    hi link htmlBold Bold
    hi link htmlItalic Italic
    hi link htmlBoldItalic BoldItalic

else
    echo "Requires 256 colours"
endif

" vim: set fdl=0 fdm=marker:
