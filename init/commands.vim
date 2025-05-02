" Customized Commands Definations
"
" Name: commands.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" CLI English-Chinese Dictionary Interface
" ========================================
"
" Use the `kd` crystal clear command-line dictionary as instant translate
" tool, note that the `kd` should be installed first.
"
" See Also: a crystal clear command-line dictionary, written in Go, supported
" Linux/Win/Mac, <https://github.com/Karmenzind/kd>.
"
command KD execute "vertical terminal"
    \. " python -u "
    \. expand("$VIMRUNTIME")
    \. "/init/python/kds.py"
