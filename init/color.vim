" vim 颜色配置
"
" name   : color.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 设置了 Vim 编辑器主窗口，以及相应的 Airline 的颜色、主题等，可以根据实
" 际情况进行相应的调整。在 .vimrc 中使用 `source` 命令导入本文件。
"
" 注意：文件中指定使用的主题必需额外安装。
"
" Vim 主题设置
" ============
"
" 设置通用的主题
colorscheme one

" 下面的代码可以设置终端和图形界面使用不同的主题，以便于适配 Windows
" Terminal 美化；以及针对不同编程语言设置不同配色方案的方法。仅供参考。
"
" if has('gui_running')
"     if expand("%:e") == "py"
"         colorscheme idle
"     else
"         colorscheme OceanicNext
"         colorscheme gruvbox
"     endif
"     colorscheme one
" else
"     colorscheme one
" endif

" Airline 主题设置
" ================
"
" 设置通用的主题
let g:airline_theme="one" 

" 下面的代码可以设置终端和图形界面使用不同的主题，以便于适配 Windows
" Terminal 美化；以及针对不同编程语言设置不同配色方案的方法。仅供参考。
"
" Plugin 'vim-airline'    
" if has('gui_running')
" 	if expand("%:e") == "py"
" 		let g:airline_theme="purewhite" 
" 	else
" 		let g:airline_theme="gruvbox" 
" 	endif
" else
" 	let g:airline_theme="gruvbox" 
" endif

" hi User1 cterm=none ctermfg=gray ctermbg=darkgray
" hi User2 cterm=none ctermfg=darkgrey ctermbg=gray
" hi User3 cterm=bold ctermfg=darkgrey ctermbg=gray
" hi User4 cterm=bold ctermfg=yellow ctermbg=gray
" hi User5 cterm=none ctermfg=darkgrey ctermbg=gray
" hi User6 cterm=none ctermfg=darkgrey ctermbg=gray
" 
" " 设置 tab 栏
" " 选中的tab颜色
" hi SelectTabLine term=Bold cterm=Bold ctermfg=DarkYellow ctermbg=LightGray
" hi SelectPageNum cterm=None ctermfg=DarkRed ctermbg=LightGray
" hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=LightGray
" 
" " 未选中状态的tab
" hi NormalTabLine cterm=None ctermfg=Gray ctermbg=DarkGray
" hi NormalPageNum cterm=None ctermfg=Gray ctermbg=DarkGray
" hi NormalWindowsNum cterm=None ctermfg=Gray ctermbg=DarkGray
" 
" " tab栏背景色
" hi TabLineFill term=reverse ctermfg=5 ctermbg=7 guibg=#6c6c6c

" 亮暗模式切换函数
" ================
"
let s:is_light= 0

func! SwitchLightDark()
    if s:is_light == 0
        let s:is_light = 1
	set background=light
    else
	let s:is_light = 0
	set background=dark
    endif
endfunc
