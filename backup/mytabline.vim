" TabLine 功能
" 
" name   : mytabline.vim
" author : 盒子online_1396529
" date   : 2024/10/11

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        let hlTab = ''
        let select = 0
        if i + 1 == tabpagenr()
            let hlTab = '%#SelectTabLine#'
            let s ..= hlTab . '⎡%#SelectPageNum#%T' . (i + 1) . hlTab
            let select = 1
        else
            let hlTab = '%#NormalTabLine#'
            let s ..= hlTab . "⎡%#NormalTabLine#%T" . (i + 1) . hlTab
        endif

        " the label is made by MyTabLabel()
        let s .= ' %<%{MyTabLabel(' . (i + 1) . ', ' . select . ')} '
        "追加窗口数量
        let wincount = tabpagewinnr(i + 1, '$')
        if wincount > 1
            if select == 1
                let s .= "%#SelectWindowsNum#" . wincount
            else
                let s .= "%#NormalWindowsNum#" . wincount
            endif
        endif
        let s .= hlTab . "⎦"
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s ..= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
      let s ..= '%=%#TabLine#%999X░❨X❩'
    endif

    return s
endfunction

" Now the MyTabLabel() function is called for each tab page to get its label. >
function MyTabLabel(n, select)
    let label = ''
    let buflist = tabpagebuflist(a:n)

    for bufnr in buflist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor

    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])

    if name == ''
        if &buftype == 'quickfix'
            let name = '[Quickfix List]'
        else
            let name = '[No Name]'
        endif
    else
        let name = fnamemodify(name, ':t')
    endif

    let label .= name
    return label
endfunction
