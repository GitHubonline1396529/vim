" System Compatibility for Vim Configuration 
"
" Name: init.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Specific Shell Configurations for Windows Compatibility 
" =======================================================
" 
" Considering the compatibility issues with older versions of Windows CMD, Vim
" should always use PowerShell as the terminal shell when running on Windows
" platform.
"
" The following function is designed to get name of current shell, so that I
" can pass it to the `shell` variable. However after some trails I realize
" that Vimscript doesn't allow such kind of
" function! CurrentShellName()
"     return fnamemodify(&shell, ':t')
" endfunction
" 
" set shell=CurrentShellName()

autocmd VimEnter * let &shell = fnamemodify(&shell, ':t')

" Get the name of the excuteable file of current shell.
let &shell = fnamemodify(&shell, ':t')

" If current shell is cmd.exe change it to be powershell.exe
if &shell ==# 'cmd.exe'
    let &shell = 'powershell.exe'
endif

" if has('win32') || has('win64') || has('win16')
    " set shell=powershell.exe
    " set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -c
    " set shellquote=\"
    " set shellxquote=
    " let $TMP="%USERPROFILE%/AppData/Local/Temp"
    " set directory=.,$TMP,$TEMP
" endif

set noshelltemp

