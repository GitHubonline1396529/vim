
" Vim Table of Content Functions for Document Browsing
"
" Name: tocs.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529

" Flag variable to indicate whether the table of contents is expanded
" -------------------------------------------------------------------
" 
let s:is_toc_shown = 0

" Functions to open and close the table of contents
" -------------------------------------------------
" 
" Initially, I planned to implement separate handling for opening tables of 
" contents for Markdown and TeX files. Later, I discovered that VimTeX already 
" defines `\lt` as the hotkey for opening LaTeX tables of contents, so this 
" setting became unnecessary. It is commented out for now.
"
" Function to open the table of contents
" function! ShowToc()
"     if expand("%:e") == "tex"
"         :VimtexTocToggle
"     elseif expand("%:e") == "md" ||
"         \ expand("%:e") == "markdown" ||
"         \ expand("%:e") == "mdown" ||
"         \ expand("%:e") == "mkdn" ||
"         \ expand("%:e") == "mkd" ||
"         \ expand("%:e") == "mdwn" ||
"         \ expand("%:e") == "mdtxt" ||
"         \ expand("%:e") == "txt" ||
"         \ expand("%:e") == "mdtext" ||
"         \ expand("%:e") == "text" ||
"         \ expand("%:e") == "rmd"
"         Vista
"     endif
" endfunction

" Function to close the table of contents
" function! ShutToc()
"     if expand("%:e") == "tex"
"         :VimtexTocToggle
"     elseif expand("%:e") == "md" ||
"         \ expand("%:e") == "markdown" ||
"         \ expand("%:e") == "mdown" ||
"         \ expand("%:e") == "mkdn" ||
"         \ expand("%:e") == "mkd" ||
"         \ expand("%:e") == "mdwn" ||
"         \ expand("%:e") == "mdtxt" ||
"         \ expand("%:e") == "txt" ||
"         \ expand("%:e") == "mdtext" ||
"         \ expand("%:e") == "text" ||
"         \ expand("%:e") == "rmd"
"         Vista!
"     endif
" endfunction

" Consider extending the window based on its size
" -----------------------------------------------
"
" It seems that by using `Vista!!` we can both open and close the Vista window. 
" So this function is no longer necessary. See also `init/keymap.vim`.
"
" function! TocBar()
"     if s:is_toc_shown == 0
"         let s:is_toc_shown = 1
"         Vista
"     else 
"     let s:is_toc_shown = 0
"     Vista!
"     endif
" endfunction

function! TocBarExt()
    if s:is_toc_shown == 0
        let s:is_toc_shown = 1
        let &columns += 30
        Vista
    else
        let s:is_toc_shown = 0
        let &columns -= 30
        Vista!
    endif
endfunction
 
" function! TocBar()
"     if s:is_toc_shown == 0
"         let s:is_toc_shown = 1
"         :call ShowToc()
"     else 
"     let s:is_toc_shown = 0
"     call ShutToc()
"     endif
" endfunction

" function! TocBarExt()
"     if s:is_toc_shown == 0
"         let s:is_toc_shown = 1
"         let &columns += 30
"         :call ShowToc()
"     else
"         let s:is_toc_shown = 0
"         let &columns -= 30
"         call ShutToc()
"     endif
" endfunction

