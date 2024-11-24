" Vim Ipython Plugin Hotkey Settings
"
" Name: ipythonkm.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Description: Most of the following settings were given out by hanschen 
" officially. I made some customized modifies.
"
" See Also:
"   [1] https://github.com/hanschen/vim-ipython-cell
"   [2] init/plugs/ipythonrc.vim
"   [3] init/keymaps.vim
"
" Keyboard mappings. <Leader> is \ (backslash) by default
"
" map <Leader>is to start IPython
nnoremap <Leader>is :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>ir :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>iR :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>ic :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>iC :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>il :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>ix :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>ih <Plug>SlimeLineSend
xmap <Leader>ih <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>ip :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>iQ :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>id :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>iq :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert 
" mode
"
" nmap <F9> :IPythonCellInsertAbove<CR>a
" nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
"
" imap <F9> <C-o>:IPythonCellInsertAbove<CR>
" imap <F10> <C-o>:IPythonCellInsertBelow<CR>


