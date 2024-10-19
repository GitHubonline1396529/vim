" Vim 键盘键位设置
" 
" name   : keymap.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 基础按键设置
" ============
"
"
" 定义了个人常用的 vim 热键，可在 .vimrc 中使用 `source` 命令导入本文件。
"
" 引导按键
let mapleader='\'

" 用按键 z 来
" nnoremap z za

" 窗口移动快捷键
" --------------
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
" emmm 这个设计挺好的
" 但是我觉得 :wq 更能帮助可怜的乌干达儿童
" noremap <Leader>s :w<CR>
" noremap <Leader>q :q<CR>

" 切换亮暗模式
" ============
source $VIMRUNTIME/init/color.vim

nnoremap <Leader>k :call SwitchLightDark()<CR>

" 自动编译功能
" ============
" 
" 用于自动编译功能的函数定义文件
source $VIMRUNTIME/init/runcode.vim

" 按键绑定
" --------
" 
" 定义编译和调试功能按键分别为 F5 和 F6
map  <F5>  :w<CR>:call Run()<CR>
imap <F5>  <ESC>:w<CR>:call Run()<CR>
map  <F6> :w<CR>:call Debug()<CR>
imap <F6> <ESC>:w<CR>:call Debug()<CR>

" 设置自动打开 Markdown 目录
" ==========================
" 
" 导入目录栏开关函数
" ------------------
" 
" 需要 Vista 和 VimTex 插件
source $VIMRUNTIME/init/tocs.vim

" 绑定目录栏快捷键
" ----------------
" 
" 针对一般情况
nnoremap <Leader>v :call TocBar()<CR>

" 针对在小窗口模式下想要延长窗口宽度打开文件管理器的情况
" 设置快捷键为 Ctrl + \
nnoremap <Leader>V :call TocBarExt()<CR>

" 设置打开终端的热键
" ==================
"
" 导入用于启动终端 terminal 的函数
" --------------------------------
"
source $VIMRUNTIME/init/terminal.vim

" 热键定义
" --------
"
" 适配 Windows Powershell
nnoremap <Leader>wp :call OpenTerminal('powershell')<CR>

" 适配 Windows 的 Powershell 7
nnoremap <Leader>pw :call OpenTerminal('pwsh')<CR>

" 适配 Windows 原生的 CMD
nnoremap <Leader>cl :call OpenTerminal('cmd')<CR>

" 适配 Bash
nnoremap <Leader>bs :call OpenTerminal('bash')<CR>

" 适配 Zsh
nnoremap <Leader>zs :call OpenTerminal('zsh')<CR>

" 设置透明化
" ==========
"
" 需要 `vimtweak64.dll` 插件
"
" 创建一个变量为当前窗口透明度
" ----------------------------
"
let s:alpha_level=255

" 创建窗口透明度控制函数
" ----------------------
"
" 实现透明度的逐级调节从
function AdjustAlpha()
    if s:alpha_level > 210
	let s:alpha_level -= 15
    else
	let s:alpha_level = 255
    endif
    call libcallnr("vimtweak64.dll", "SetAlpha", s:alpha_level)
endfunction

" 将函数绑定到热键
" ----------------
"
nnoremap <Leader>sa :call AdjustAlpha()<CR>

" 设置打开文件管理器
" ==================
"
" 正常情况下的 NERDTree 按键设置
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" 针对在小窗口模式下想要延长窗口宽度打开文件管理器的情况
nnoremap <Leader>N :call NERDTreeBar()<CR>

let s:NERDTree_feature = 0

func! NERDTreeBar()
    if s:NERDTree_feature == 0
        let s:NERDTree_feature = 1
	let &columns += 36
        NERDTreeToggle
    else 
	let s:NERDTree_feature = 0
        let &columns -= 36
        NERDTreeToggle
    endif
endfunc

" 针对 NERDTree 插件实在是无论怎么搞也安装不上去的情况，可以采用下面这套方
" 案，只需要 Vim 原生的 Netrw 就能工作。
" 
" " 快捷键是 \ + e
" map <Leader>e :call VexBar()<CR>
" imap <Leader>e :call VexBar()<CR>

" let s:verbar_feature = 0

" " 由于功能实现上的一些问题，不得不将打开文件管理器和关闭文件管理器的功能
" " 设置在同一个函数里面。
" func! VexBar()
"     if s:verbar_feature == 0
"         let s:verbar_feature = 1
"         let win_state = winrestcmd()
"         let is_maximized = win_state =~# '^\s*normal'
" 	let &columns += 20
"         Vex
"     else 
" 	let s:verbar_feature = 0
"         let winnr = winnr('$')  " 获取当前窗口数量
"         if winnr > 1
"             let leftmost = 1
"             let leftmost_width = winwidth(leftmost)
"             for i in range(2, winnr)
"                 let cur_width = winwidth(i)
"                 if cur_width < leftmost_width
"                     let leftmost = i
"                     let leftmost_width = cur_width
"                 endif
"             endfor
"             execute leftmost . 'wincmd c'  
"             " 关闭最左侧窗口
"         else
"             echo "只有一个窗口，无法关闭。"
"         endif
" 	let &columns -= 20
"     endif
" endfunc

" 在文件管理器中打开目录功能
" ==========================
"
" 注意：这个设置只能再 Windows 系统上生效
"
" CMD 的启动比 powershell 稍微快那么一点
" nnoremap <Leader>e :redraw! | silent! !powershell -c start .<CR>
nnoremap <Leader>e :silent! !start .<CR>

" CocList 设置
" ============
"
" 如下设置来自 CocList 给出的默认设置，在这里保留以便确保代码兼容性。
"
" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

