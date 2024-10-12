" Vim 配置主文件
"
" name   : init.vim
" author : 盒子online_1396529
" date   : 2024/10/11
" 
" Vim 的配置文件，适用于 gVim 9.1 或以上版本，Windows 操作系统。（理论上
" 可以进行跨平台移植，但这一尝试在本项目中从未进行过）
"
" 文件目录说明：请将本文件和相应的 `.vim` 文件夹一同放置在 vim 的安装目录
" 下，而不是像通常在 Unix/Linux 上那样，放置到用户的主目录下。这一做法是
" 为了照顾 Windows 系统惨不忍睹的 C 盘空间，因为我们通常会将 Vim 安装到 D
" 或其他磁盘。
"
" 如果需要沿用传统，或者改变配置路径，你需要找到文件中所有的 `$VIMRUNTIME`
" （`$VIMRUNTIME` 会自动匹配 Vim 的安装目录），并进行相应的修改，具体操作
" 略。

" ================
" 关键的自定义设置
" ================
" 
" WARNING: 这部分设置是必要的，且对于任何移植配置的情形，都需要针对性地进
" 行修改。需要额外关注！
"
" 指定 Python 的安装路径
" ======================
"
" 部分插件的功能依赖 Python，你需要额外指定修改。
set pythonthreedll=D:\Python\Python39\python39.dll

" ========
" 基础设置
" ========
"
" 这部分内容规定了 Vim 的一些基本设置，包括但不限于字体、窗口尺寸、缩进规
" 则、代码折叠、文件编码、样式等。

" ========
" 文件设置
" ========
"
set modelines=0 " 禁用模式行（安全措施）
filetype on " 开启文件类型检测
set encoding=utf-8 " 编码设置
set termencoding=utf-8 " 编码设置
set fileencoding=utf-8 " 编码设置

" 显示设置
" ========
"
" 设置 GUI 模式下的窗口尺寸，默认为 25 行 80 列，符合一般的编程习惯。
if has('gui_running')
    set lines=25 columns=80 
endif

" set colorcolumn=81 " 80 列尺

syntax on " 语法高亮
set number " 显示行号
" set sm! " 高亮显示匹配括号
set hlsearch " 高亮查找匹配
set cursorline " 高亮显示当前行
set termguicolors " 启用终端真色

set showmatch " 显示匹配
set ruler " 显示标尺，在右下角显示光标位置
set novisualbell " 不要闪烁
set showcmd " 显示输入的命令

set laststatus=2 " always show statusline
" set showtabline=2 " always show tabline
set showtabline=0 " always show tabline
set vb t_vb=
set tabline=%!MyTabLine()

" set relativenumber " 显示相对行号

" ========
" 编辑设置
" ========
set smartindent " 智能缩进
set autoindent " 自动对齐
set smarttab

" 原本这段内容是只对 Python 文件生效的
" 但是由于近年来我写代码习惯的变化
" 我开始给所有类型的代码使用 4 空格缩进
" 所以注释这段，转而直接设置 4 空格缩进为默认形式
"
" if expand("%:e") == "py"
"     set tabstop=4 " tab缩进
"     set shiftwidth=4 " 设定自动缩进为4个字符
"     set expandtab " 用space替代tab的输入
" endif

" 针对 makefile 不启用这些设置，
" `autocmd BufRead,BufNewFile *` 使命令在每次读取或新建文件时触发
autocmd BufRead,BufNewFile * if expand("%:t") =~? '^makefile$' |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ endif

set splitright " 设置左右分割窗口时，新窗口出现在右侧
set splitbelow " 设置水平分割窗口时，新窗口出现在底部

set nobackup " 不需要备份
set noswapfile " 禁止生成临时文件
set autoread " 文件自动检测外部更改
set clipboard=unnamed " 共享剪切板

" set nocompatible " 去除vi一致性
set ambiwidth=double " 解决中文标点显示的问题
" set nowrap " 不自动折行
set mouse=a " 使用鼠标
set mousehide " 输入时隐藏光标
set sidescroll=10 " 移动到看不见的字符时，自动向右滚动10个字符

" set paste " 保持黏贴格式

" 设置代码折叠
" set nofoldenable " 启动 vim 时关闭折叠代码
" set foldmethod=indent " 设置语法折叠
" setlocal foldlevel=99 " 设置折叠层数
" nnoremap <space> za " 用空格键来开关折叠

" 设置光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set completeopt=longest,menu   " 自动补全配置让Vim补全菜单行为跟IDE一致
set backspace=indent,eol,start " 允许用退格键删除字符

" 设置字体和字体大小, 只对gui客户端起作用，终端使用需要修改终端字体和大小
set guifont=Consolas\ for\ Powerline\ FixedD:h12
" set guifont=Ububtu\ Mono:h12
" set guifont=Meslo\ LG\ S\ for\ Powerline:h12

" 设置中西文不同字体显示
" 不过现在为了设置和插件适配都注释掉了
" set guifont=Consolas:h12:cANSI
" set guifont=Consolas\ for\ Powerline\ FixedD:h12 
set guifontwide=SimHei:h12

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" ========
" 颜色配置
" ========
" 
source $VIMRUNTIME/init/color.vim

" ========
" 插件配置
" ========
"
source $VIMRUNTIME/init/plugrc.vim

" 状态栏和 tab 栏
" ---------------
" 
" MyTabLine 功能我也不知道是干什么用的，反正一直在我的配置里面
" 好像是实现了一个改进的 Buffer 查看的功能
source $VIMRUNTIME/init/mytabline.vim
source $VIMRUNTIME/init/statubar.vim

" ==========================
" 自定义快捷键及其相关的函数
" ==========================

" 快捷键绑定
" ----------
source $VIMRUNTIME/init/keymap.vim
