" Vim 终端设置
"
" name   : terminal.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 定义全局变量，设置终端高度
" --------------------------
"
let g:terminal_height = 10

" 指定各个终端选项
" ----------------
"
" 定义一个字典，存储不同终端的命令
let g:terminals = {
\ 'powershell': 'powershell',
\ 'pwsh': 'pwsh',
\ 'cmd': 'cmd',
\ 'bash': 'bash --login -i',
\ 'zsh': 'zsh --login -i'
\ }

" 通用的终端打开函数，传入终端类型
function! OpenTerminal(term)
    let l:cmd = get(g:terminals, a:term, '')
    if l:cmd != ''
        execute 'term ++rows=' . g:terminal_height . ' ' . l:cmd
    else
        echohl ErrorMsg | echo "Unsupported terminal: " . a:term
    endif
endfunction

