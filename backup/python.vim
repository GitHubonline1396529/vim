" Handles Various Interaction Issues Between Vim and Python
" 
" Name: python.vim
" Author: ChatGPT =)
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529

" General Python script invocation function
" =========================================
"
function! CallPythonScript(script_name, ...)
    " Get the $VIMRUNTIME path and replace it with a format suitable for the 
    " current platform
    let runtime_path = substitute(expand("$VIMRUNTIME"), '\\', '/', 'g')

    " Construct the full script path
    let script_path = runtime_path . "/init/python/" . a:script_name

    " Check if the script exists
    if !filereadable(script_path)
        echoerr "Python script not found: " . script_path
        return
    endif

    " Get all passed arguments and process them with shellescape (to prevent 
    " special character issues)
    let args = []
    for arg in a:000
        call add(args, shellescape(arg))
    endfor

    " Construct the Python command
    let cmd = "python " . shellescape(script_path) . " " . join(args, " ")

    " Execute the command using system()
    let result = system(cmd)

    " Output the command result to Vim's message area
    if v:shell_error != 0
        echoerr "Error executing script: " . script_path
    else
        echo result
    endif
endfunction

