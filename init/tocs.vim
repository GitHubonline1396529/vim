" Vim 目录功能配置
"
" name   : tocs.vim
" author : 盒子online_1396529
" date   : 2024/10/12

" 表示目录是否展开的 Flag 变量
" ----------------------------
" 
let s:is_toc_shown = 0

" 设置打开和关闭目录的函数
" ------------------------
" 
" 此处的设置，根据我原先的打算，是要对 Markdown 和 TeX 分别作打开目录的处
" 理。后来发现在 VimTeX 中已经定义了 `\lt` 作为打开 LaTeX 目录的热键，因
" 此这个设置就不必要了。姑且注释掉。
"
" 打开目录的函数
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

" 关闭目录的函数
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

" 针对大小窗口的情况分别考虑是否延长窗口
" --------------------------------------
"
function! TocBar()
    if s:is_toc_shown == 0
        let s:is_toc_shown = 1
        Vista
    else 
	let s:is_toc_shown = 0
    Vista!
    endif
endfunction

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
" 	let s:is_toc_shown = 0
"     call ShutToc()
"     endif
" endfunction

" function! TocBarExt()
"     if s:is_toc_shown == 0
"         let s:is_toc_shown = 1
" 	    let &columns += 30
"         :call ShowToc()
"     else
" 	    let s:is_toc_shown = 0
" 	    let &columns -= 30
"         call ShutToc()
"     endif
" endfunction
