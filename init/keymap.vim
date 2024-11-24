" Vim Keymapping Settings
" 
" Name: keymap.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Description: This configuration file consists of two parts: 
" 
" The first part includes basic Vim key mappings, such as setting the map
" leader, shortcuts for debugging and code navigation, toggling line number 
" display modes (absolute line numbers, relative line numbers, or no line
" numbers), switching between light and dark modes, and adjusting window 
" transparency.
" 
" The second part organizes key mappings into separate modules. For easier code
" navigation and maintenance, I have separated the key mappings for each plugin
" and functional module into individual `.vim` files under the `init/keymaps`
" directory. These files are loaded into the main configuration using the
" `source` command.
"
" See Also:
"   [1] init/keymaps/ipythonkm.vim  
"   [2] init/keymaps/vimwinkm.vim "
"   [3] init/keymaps/coclistkm.vim 
"   [4] init/keymaps/nerdtreekm.vim
"
" Import Dependencies and Hotkey Settings for Each Modules
" ========================================================
"
" Dependencies
source $VIMRUNTIME/init/color.vim 
source $VIMRUNTIME/init/runcode.vim
source $VIMRUNTIME/init/tocs.vim

" Independent Keymapping Modules
source $VIMRUNTIME/init/keymaps/ipythonkm.vim " Keymapping for Ipython Shell
source $VIMRUNTIME/init/keymaps/vimwinkm.vim " Window Navigations
source $VIMRUNTIME/init/keymaps/coclistkm.vim " Window Navigations
source $VIMRUNTIME/init/keymaps/nerdtreekm.vim " Window Navigations

" I found these hotkeys are not very useful in pratical programming, so I
" commented it.
"
" source $VIMRUNTIME/init/keymaps/termkm.vim " Keymapping to open Terminals

" Basic Keymapping Settings
" =========================
"
" 定义了个人常用的 vim 热键，可在 .vimrc 中使用 `source` 命令导入本文件。
"
" 引导按键
let mapleader='\'

" Light and Dark mode switching
" =============================
nnoremap <Leader>k :call SwitchLightDark()<CR>

" Compline, Run and Debug Script
" ==============================
" 
" Complining or Run Script is defined to be <F5>.
" Debugging is defined to be <F6>.
"
map  <F5> :w<CR>:call Run()<CR>
imap <F5> <ESC>:w<CR>:call Run()<CR>
map  <F6> :w<CR>:call Debug()<CR>
imap <F6> <ESC>:w<CR>:call Debug()<CR>

" Bind shortcuts for the directory sidebar
" ========================================
" 
" General case
nnoremap <Leader>v :Vista!!<CR>

" When using a narrow window, increase width and open the file manager
nnoremap <Leader>V :call TocBarExt()<CR>

" Toggle between absolute and relative line numbers
" ================================================
"
" Allow switching line number modes using the `\nu` command. Toggle between 
" no line numbers, absolute line numbers, and relative line numbers to suit 
" different needs.
"
let s:nu_flag = 0

function SetNuState()
    if s:nu_flag == 0
	let s:nu_flag = 1
        set nu
	set relativenumber
    elseif s:nu_flag == 1
	let s:nu_flag = 2
	set nonu
	set norelativenumber
    elseif s:nu_flag == 2
	let s:nu_flag = 0
        set nu
	set norelativenumber
    endif
endfunction

nnoremap <Leader>nu :call SetNuState()<CR>

" Enable Window Transparency Adjust
" =================================
"
" Requires the `vimtweak64.dll` plugin
"
" Bind the function to a shortcut:
nnoremap <Leader>sa :call AdjustAlpha()<CR>

" Open the current directory in a file explorer
" =============================================
"
" Note: This setting works only on Windows systems
"
" Using CMD is slightly faster than PowerShell
" nnoremap <Leader>e :redraw! | silent! !powershell -c start .<CR>
nnoremap <Leader>e :silent! !start .<CR>

