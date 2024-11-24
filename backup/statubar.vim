" name   : statubar.vim
" author : 盒子online_1396529
" date   : 2024/10/11
" 
" 设置状态行
" ----------
" 
" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型

set statusline=%1*%F%m%r%h%w%=\ 
set statusline+=%2*\ %Y\ \|\  
set statusline+=%3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\ 
set statusline+=%4*[%l:%v]\ 
set statusline+=%5*%p%%\ \|\ 
set statusline+=%6*%LL\ 


