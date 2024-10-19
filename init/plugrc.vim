" Vim 插件配置
" 
" name   : plugrc.vim
" author : 盒子online_1396529
" date   : 2024/10/11
"
" Vim 编辑器插件部分的配置方案，使用 Vim-Plug 管理插件。需要额外提前将
" `plug.vim` 放置到 gVim 的可执行文件目录下。
"
" 注意：并不是所有插件均通过 
"
" 配置 Vim 插件
" =============
" 
" vim-plug 插件配置
" -----------------
" 
" 用来安装各种插件，输入 `PlugInstall` 开始安装。
" 需要能够访问 Github 才能拉取到插件。
"
" 需要注意的是：
"
" 1. 各类主题插件，如 `gruvbox`、`vim-one`，会出现安装后无法正确工作的问题。
" 2. `markdown-preview`，直接安装无法使用，需要手动迁移一个 `.exe` 文件
" 3. 透明化需要手动下载一个 `.dll` 文件安装。

call plug#begin('$VIMRUNTIME/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', {
      \ 'do': { -> mkdp#util#install() },
      \ 'for': ['markdown', 'vim-plug']
      \ }
Plug 'liuchengxu/vista.vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'rakr/vim-one'
" Plug 'ayu-theme/ayu-vim'
Plug 'preservim/vim-markdown'

call plug#end()


" 各个插件的具体配置
" ------------------
"
" 以文件形式具体导入
source $VIMRUNTIME/init/plugs/airlinerc.vim
source $VIMRUNTIME/init/plugs/cocrc.vim
source $VIMRUNTIME/init/plugs/mkdprc.vim
source $VIMRUNTIME/init/plugs/netrwrc.vim
source $VIMRUNTIME/init/plugs/slimerc.vim
source $VIMRUNTIME/init/plugs/vimtexrc.vim
source $VIMRUNTIME/init/plugs/vistarc.vim
source $VIMRUNTIME/init/plugs/vimmdrc.vim

