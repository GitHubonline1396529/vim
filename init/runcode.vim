" name   : runcode.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 自动编译功能
" ============
" 
" 在网上看见一个狂拽酷炫的按下F9自动编译功能
" 稍微修改扩充了一下，留作自用
" 需要安装过相应的编译器 / 解释器软件才有用
"
" 针对各类 C 族语言的调试功能
" ---------------------------
"
" 因为我不是很熟悉 gdb 调试也很少写 C，这部分功能很少测试
" 因此可能存在问题。
function! Debug()
    if expand("%:e") == "c" ||
       \ expand("%:e") == "cc" ||
       \ expand("%:e") == "cxx" ||
       \ expand("%:e") == "cpp"
        exe ":setlocal makeprg=".'g++\ %\ -o\ %<\ -gstabs+'
        echohl WarningMsg | echo " compiling..."
        silent make
        exe ":!gdb %<"
        redraw!
        echohl WarningMsg | echo " Debug finish! :-)"
    elseif expand("%:e") == "md" ||
        \ expand("%:e") == "markdown" ||
        \ expand("%:e") == "mdown" ||
        \ expand("%:e") == "mkdn" ||
        \ expand("%:e") == "mkd" ||
        \ expand("%:e") == "mdwn" ||
        \ expand("%:e") == "mdtxt" ||
        \ expand("%:e") == "txt" ||
        \ expand("%:e") == "mdtext" ||
        \ expand("%:e") == "text" ||
        \ expand("%:e") == "rmd"
        :MarkdownPreview
        redraw!
        echohl WarningMsg | echo " Running on browser! :-)"
    else
        redraw!
        echo "Language not support! :-("
    endif
endfunction

" 程序运行函数
" ------------
" 
function! Run()
    " 针对 Python 语言
    " 直接调用 python 运行脚本即可。
    if expand("%:e") == "py"
        :! python -u "%<.py"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 C 族语言，使用 g++ 编译器进行编译。
    elseif expand("%:e") == "cc" ||
        \ expand("%:e") == "cxx" ||
        \ expand("%:e") == "cpp" 
        echo " compiling..."
        :! g++ "%" -o "%<" && "%<.exe"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 C 语言，使用 gcc 进行编译。
    " 在实际开发过程中基本都会写个 makefile 所以，这部分内容看个乐吧。
    elseif expand("%:e") == "c"
        echo " compiling..."
        :! gcc "%" -o "%<" && "%<.exe"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 R 语言，使用 Rscript 命令运行。
    elseif expand("%:e") == "r"
        exe ":! Rscript %"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 VBScript 语言。
    elseif expand("%:e") == "vbs"
        exe ":! %"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 Markdown 文件，调用 MarkdownPreview 插件。
    elseif expand("%:e") == "md" ||
        \ expand("%:e") == "markdown" ||
        \ expand("%:e") == "mdown" ||
        \ expand("%:e") == "mkdn" ||
        \ expand("%:e") == "mkd" ||
        \ expand("%:e") == "mdwn" ||
        \ expand("%:e") == "mdtxt" ||
        \ expand("%:e") == "txt" ||
        \ expand("%:e") == "mdtext" ||
        \ expand("%:e") == "text" ||
        \ expand("%:e") == "rmd"
        " :MarkdownPreview
	:! pandoc "%" -o "%<.pdf"
        redraw!
        echohl WarningMsg | echo " Running on browser! :-)"
    " 针对 LaTeX 文件，使用 xelatex 编译。
    elseif expand("%:e") == "tex"
        :! latexmk -xelatex %
        redraw!
        echohl WarningMsg | echo " XeLaTeX finish! :-)"
    
    " 针对 MATLAB 文件，使用 Matlab 运行。
    elseif expand("%:e") == "m"
        echo " Starting matlab..."
        :! matlab -nosplash %
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 Windows 批处理文件。
    elseif expand("%:e") == "bat"
        :! %
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
    " 针对 MapBasic 脚本文件。
    " 受不了了，MapBasic 是我有史以来见过的最狗屎的编程语言
    " 这辈子再写一次我就是傻逼！
    "
    " elseif expand("%:e") == "mb"
    "     :! "D:\Program Files (x86)\MapInfo\MapBasic\mapbasic.exe" -NOSPLASH -D "%<.mb"
    "     :! "D:\Program Files (x86)\MapInfo\MapBasic\mapbasic.exe" -NOSPLASH -L "%<.MBX"
    "     redraw!
    "     echohl WarningMsg | echo " Running finish! :-)"
    
    " 其他不支持的文件类型。
    else
        redraw!
        echo "Language not support! :-("
    endif
endfunction

