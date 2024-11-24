" Run Code in Vim
"
" Name: runcode.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Why AAA Math Here?
" ==================
"
" Question: Why does this code file use an if-else structure instead of manag-
" ing multiple compile commands with a vimscript dictionary?
"
" Answer: First, to ensure compatibility with the Windows platform, this Vim 
" configuration needs to support commands containing Vim internal parameters
" like `$VIMRUNTIME`.
"
" This is because, on Windows, C drive space is limited and always get 'red', 
" and the user's home directory `~` is not recognized in CMD. Additionally,
" various compatibility issues arise depending on the shell being used. As a
" result, certain scripts called during compilation (e.g., `./panargs.py`) must
" be placed in Vim's installation directory, which is pointed to by the Vim
" internal parameter `VIMRUNTIME`.
"
" In this scenario, if the compilation commands for different languages are 
" defined as string variables in a dictionary and then passed to the terminal 
" shell for execution, these parameters may not be properly resolved. Further-
" more, in some compatibility layers on Windows, such as Git for Windows or in 
" vimscript itself, the `execute` command may fail to resolve paths correctly.
"
" Therefore, in this file, we had to design the function in a relatively flat 
" structure.
"
" Question: Why not use any of a run-code plugin like coderunner.nvim?
"
" Answer: coderunner.nvim is writted by Lua and only support NeoVim>=8.0 while 
" usually Windows users prefer gVim.
"
" Also, Vim internal parameters line `$VIMRUNTIME` might meet with unwanted
" compatibility issues in third-party plugins. As an example, coderunner.nvim
" use JSON to manage executor map, in which, I guess, `$VIMRUNTIME` will not
" be recognized correctly.
"
" Import Dependencies
" ===================
source $VIMRUNTIME/init/system.vim

" Automantic Complining, Running and Debuging
" ===========================================
"
" Corresponding running environment should be installed with correct 
" configuration
"
" This feature requires installation of the corresponding develop environment,
" compiler, interpreter, or debugger to function properly.
"
" Function for Debuging
" ---------------------
"
function! Debug()

" For C++ Source Code
" ~~~~~~~~~~~~~~~~~~~
"
" Invoke `g++` to compline and generate the executable binary file with debug
" symbols and use `gdb` to debug.
"
" I'm not very familiar with debugging GDB and rarely write C, this part of the
" functionality is rarely tested. Therefore, there may be issues.

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

" For Markdown Documents
" ~~~~~~~~~~~~~~~~~~~~~~
"
" To 'Debug' a Markdown file is to view it visually. Here requires the Markdown
" Previre Plugin iamcco/markdown-preview.nvim.
"
" The file extention of Markdown Document has a lot of alias.

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

" Function to Run Code
" --------------------
" 
function! Run()

" For Python Script
" ~~~~~~~~~~~~~~~~~
"
" Simpy just invoke Python to run code. It deserve to be noticed that there is
" no distinction between Python 2 and Python 3 in the logic of this part of
" code. This may cause some unnecessary confusion.
  
    if expand("%:e") == "py"
        :! python -u "%<.py"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
" For C++ Source Code
" ~~~~~~~~~~~~~~~~~~~
"
" Invoke `g++` to compline and run the generated executable binary file.
"
" In practical development, generally we create a Makefile to manage C and C++
" project, rather than directly compline and building executable binary from a
" single source code file. But for those beginners in programming who usually
" get started by learning to write simple C and C++ code, such configuration 
" can provide some convenience.
 
     elseif expand("%:e") == "cc" ||
         \ expand("%:e") == "cxx" ||
         \ expand("%:e") == "cpp" 
         echo " compiling..."
         :! g++ "%" -o "%<" && "%<.exe" 
         redraw!
         echohl WarningMsg | echo " Running finish! :-)"
   
" For C Source Code
" ~~~~~~~~~~~~~~~~~
"
" Invoke `gcc` to compile and run the generated executable binary file.

     elseif expand("%:e") == "c"
         echo " compiling..."
         :! gcc "%" -o "%<" && "%<.exe"
         redraw!
         echohl WarningMsg | echo " Running finish! :-)"

" For Rust Source Code
" ~~~~~~~~~~~~~~~~~~~~
"
" We've already got Cargo the project and package manager for practical Rust
" development. This function is only to provide a quick compline for single
" Rust source code, which can help beginners to get familiar with Rust gramma
" quickly.

     elseif expand("%:e") == "rs"
         echo " compiling..."
         :! rustc "%" && "%<.exe"
         redraw!
         echohl WarningMsg | echo " Running finish! :-)"
    
" For R Script
" ~~~~~~~~~~~~
"
" Run `RScript` command.

    elseif expand("%:e") == "r"
        exe ":! Rscript %"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
" For VBScript
" ~~~~~~~~~~~~

    elseif expand("%:e") == "vbs"
        exe ":! %"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
" For Markdown Documents
" ~~~~~~~~~~~~~~~~~~~~~~
"
" Here the Markdown file's debugging is set to the preview function, while the 
" compilation of the Markdown file is set to use pandoc to convert the current
" Markdown Document into TeX sequences and call XeLaTeX to compile it into well
" -composed PDF document.
"
" The following command provides basic functionality,
"
" ! pandoc "%" -o "%<.pdf" --pdf-engine=xelatex --highlight-style tango --citeproc
"
" But for cases where report or book document types are used, it is necessary 
" to specify `--top-level-division=chapter`. Also, for cases where the first-
" level heading of the Markdown file should serve as the main title of the
" entire document, additional parameter `--shift-heading-level-by=-1` needs to
" be set.
"
" To address these situations, I wrote a script `panargs.py`. So the original 
" compile command is removed from the code. However if you still want to use
" it, just copy the line of code back to the previous position and decomment
" it.
"
" My script is located under the `$VIMRUNTIME/init/python` directory. During
" the actual execution of the script, I found that simply using the run command
" doesn't work, because the content after `:!` is directly passed to the CLI,
" causing the `$VIMRUNTIME` variable to not be effective. In other words, the
" following would not work:
"
" :! python $VIMRUNTIME/init/python/panargs.py "%"
"
" However, after testing, I found that if you're using MSYS 2 bash, it works
" fine if the colon is removed.
"
"! python $VIMRUNTIME/init/python/panargs.py "%"
"
" Based on this, we also tried using `execute` to concatenate the command, but 
" we encountered issues... Although everything seemed normal on the native
" system, tests showed that compatibility issues arose with subsystems like 
" MSYS2 in path resolution.
"
" execute "!python " . expand("$VIMRUNTIME") . "/init/python/panargs.py " . expand("%")

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
	if CurrentShellName() == "bash.exe"
	    ! python $VIMRUNTIME/init/python/panargs.py "%"
	elseif CurrentShellName() == "pwsh.exe"
            execute "!python " 
	        \. expand("$VIMRUNTIME") 
	        \. "/init/python/panargs.py " 
	        \. expand("%")
	elseif CurrentShellName() == "powershell.exe"
            execute "!python " 
	        \. expand("$VIMRUNTIME") 
	        \. "/init/python/panargs.py " 
	        \. expand("%")
	else
            execute "!python " 
	        \. expand("$VIMRUNTIME") 
	        \. "/init/python/panargs.py " 
	        \. expand("%")
	endif
        redraw!
        echohl WarningMsg | echo " Generate PDF via LaTeX! :-)"

" For LaTeX Sequences
" ~~~~~~~~~~~~~~~~~~~
"
" Use `latexmk` to build with XeLaTeX rules.
 
    elseif expand("%:e") == "tex"
        silent ! latexmk -xelatex %
        redraw!
        echohl WarningMsg | echo " XeLaTeX finish! :-)"
    
" For MALAB Scripts
" ~~~~~~~~~~~~~~~~~
"
" Run in MATLAB without GUI (There's no MATLAB CLI on Windows.)
"
" Um... eriously, Is there whoever write MATLAB script in Vim?

    elseif expand("%:e") == "m"
        echo " Starting matlab..."
        ! matlab -nosplash %
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
" For Windows Batch Script
" ~~~~~~~~~~~~~~~~~~~~~~~~
"
 
    elseif expand("%:e") == "bat" ||
        \ expand("%:e") == "cmd"
        ! %
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"
    
" For MapBasic Scripts
" ~~~~~~~~~~~~~~~~~~~~
"
" I can't take it anymore, MapBasic is the worst bullshit fucking programming
" language I've ever seen. I'll curse myself to be an stupid jerk once ever I
" write it again! 
 
    " elseif expand("%:e") == "mb"
    "     ! "D:\Program Files (x86)\MapInfo\MapBasic\mapbasic.exe" -NOSPLASH -D "%<.mb"
    "     ! "D:\Program Files (x86)\MapInfo\MapBasic\mapbasic.exe" -NOSPLASH -L "%<.MBX"
    "     redraw!
    "     echohl WarningMsg | echo " Running finish! :-)"
    
" For other unsupported file types
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
 
    else
        redraw!
        echo "Language not support! :-("
    endif
endfunction
