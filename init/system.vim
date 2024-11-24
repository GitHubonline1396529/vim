" System Compatibility for Vim Configuration 
"
" Name: init.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Specific Shell to Use on Windows
" ================================
" 
" Considering the compatibility issues with older versions of Windows CMD, Vim
" should always use PowerShell as the terminal shell when running on Windows
" platform.
" if has('win32') || has('win64') || has('win16')
"     set shell=powershell.exe
"     set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -c
"     set shellquote=\"
"     set shellxquote=
" endif

" Function to get name of current shell
function! CurrentShellName()
    return fnamemodify(&shell, ':t')
endfunction
