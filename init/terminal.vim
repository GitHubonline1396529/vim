" Vim Terminal Settings
"
" Name: terminal.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Define a global variable to set terminal height
" -----------------------------------------------
"
let g:terminal_height = 10

" Specify options for various terminals
" -------------------------------------
"
" Define a dictionary to store commands for different terminals
let g:terminals = {
\ 'powershell': 'powershell',
\ 'pwsh': 'pwsh',
\ 'cmd': 'cmd',
\ 'bash': 'bash --login -i',
\ 'zsh': 'zsh --login -i'
\ }

" General function to open a terminal, passing the terminal type
function! OpenTerminal(term)
    let l:cmd = get(g:terminals, a:term, '')
    if l:cmd != ''
        execute 'term ++rows=' . g:terminal_height . ' ' . l:cmd
    else
        echohl ErrorMsg | echo "Unsupported terminal: " . a:term
    endif
endfunction

