" Vim Markdown 插件配置
"
" name   : vimmdrc.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" 
" 代码折叠设置
" ============
"
" 禁用 Markdown 代码折叠
" let g:vim_markdown_folding_disabled = 1
"
" 在主配置文件 `init.vim` 中使用 `set [no]foldenable` 设置默认不折叠代码
"
" 设置 Markdown 代码折叠为 Python 风格
let g:vim_markdown_folding_style_pythonic = 1

" To prevent foldtext from being set add the following to your .vimrc:
let g:vim_markdown_override_foldtext = 0

" 设置 Markdown 标题的折叠等级
let g:vim_markdown_folding_level = 6

" 热键设置
" ========
"
" 不启用 Vim Markdwon 自带的热键方案，防止和自定义的热键相冲突
let g:vim_markdown_no_default_key_mappings = 1

" 虚拟字符设置
" ============
"
" 在 Markdown 中启用 / 禁用虚拟字符
let g:vim_markdown_conceal = 1

" 数学虚拟字符设置 
let g:tex_conceal = ""
let g:vim_markdown_math = 0

" 代码块的虚拟字符
let g:vim_markdown_conceal_code_blocks = 0

" 启用开头的 YAML 数据
" ====================
"
let g:vim_markdown_frontmatter = 1

" 表格格式设置
" ============
"
" 启用无边界的简易表格样式
let g:vim_markdown_borderless_table = 1
