" Airline 插件配置
" 
" name   : airline.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 用于设置顶上和底下的信息栏。
" 
" Airline 颜色设置
" ----------------
"
" 这行内容被注释了。这是因为对于 Airline 主题的设置位于 color.vim 内
" let g:airline_theme="one" 

" 启用 Powerline 字体
" -------------------
" 
" 这个是安装字体后必须设置此项 
let g:airline_powerline_fonts = 1   

" 打开 tabline 功能
" -----------------
" 
" 方便查看 Buffer 和切换，省去了 minibufexpl 插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置切换 Buffer 快捷键 
" ----------------------
" 
" 使用 Ctrl + Tab 和 Ctrl + Shift + Tab 切换文件
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

" 关闭状态显示空白符号计数
" ------------------------
"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 特殊字符符号
" ------------
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.colnr = ' ㏇:'
" let g:airline_symbols.colnr = ' ℅:'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = ' ␊:'
" let g:airline_symbols.linenr = ' ␤:'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'

" 在终端中一些显示会出问题。不能保证在终端使用 Powerlien 字体，所以这里干
" 脆分开处理一下来避免。
if has('gui_running')
  " powerline symbols
  " 不知道为什么这里有一些字符我显示不出来，这里用下面的 old symbols
  "
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  let g:airline_symbols.colnr = ' ℅:'
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ' :'
  " let g:airline_symbols.maxlinenr = '☰ '
  let g:airline_symbols.dirty='⚡'

  " powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
else
  " powerline symbols
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  " let g:airline_symbols.colnr = ' ℅:'
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ' :'
  " let g:airline_symbols.maxlinenr = '☰ '
  " let g:airline_symbols.dirty='⚡'

  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '>'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '<'
  let g:airline_symbols.branch = ' Y '
  let g:airline_symbols.colnr = ' % '
  let g:airline_symbols.readonly = ' ! '
  let g:airline_symbols.linenr = ' LN '
  let g:airline_symbols.maxlinenr = ' = '
  let g:airline_symbols.dirty=' $ '
endif
