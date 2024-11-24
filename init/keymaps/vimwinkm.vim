" Vim Key Mapping fow Window Navigations
"
" Name: vimwinkm.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Hotkey to switch Window with Tabs
" ---------------------------------
" 
" 按下 Tab + 方向键可用切换窗口
" 
" 这个功能我觉得使用方向键而不是 hjkl 很不 Vim，而且也不算很常用，所以暂时
" 注释了。
" noremap <TAB><left> <C-w><left>
" noremap <TAB><right> <C-w><right>
" noremap <TAB><up> <C-w><up>
" noremap <TAB><down> <C-w><down>

noremap <TAB>w <C-w>w
noremap <TAB>h <C-w><left>
noremap <TAB>l <C-w><right>
noremap <TAB>k <C-w><up>
noremap <TAB>j <C-w><down>

" 使用方向键切换 buffer
" ---------------------
" 
" 这个之前已经定义过 ctrl + Tab 了
" noremap <Leader><left> :bp<CR>
" noremap <Leader><right> :bn<CR>

" 使用方括号切换 tab
" ------------------
"
" noremap <Leader>] :tabnext<CR>
" noremap <Leader>[ :tabprevious<CR>

" 使用 \ + s 保存, \ + q 退出
" ---------------------------
" 
" noremap <Leader>s :w<CR>
" noremap <Leader>q :q<CR>

