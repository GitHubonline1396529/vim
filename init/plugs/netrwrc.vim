" Netrw 插件配置
"
" name   : netrwrc.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" netrw
" Vim 默认自带的文件目录管理器
" -------------

let g:netrw_banner = 0         " 设置是否显示横幅
let g:netrw_liststyle = 1      " 设置目录列表样式：树形
let g:netrw_browse_split = 4   " 在之前的窗口编辑文件
let g:netrw_altv = 1           " 水平分割时，文件浏览器始终显示在左边
let g:netrw_winsize = 20       " 设置文件浏览器窗口宽度为25%
let g:netrw_hide = 0           " 默认显示隐藏的文件
" let g:netrw_list_hide= '^\..*' " 不显示隐藏文件 
" 用 a 键就可以显示所有文件、 隐藏匹配文件或只显示匹配文件

" 自动打开文件浏览器
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * :Vexplore
" augroup END

" nnoremap <SPACE>ft :Lexplore<CR> " 空格 + f + t 打开或关闭目录树
