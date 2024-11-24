" Vim-Plug Configuration 
" 
" Name: plugrc.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Configuration for Vim editor plugins, specified what plugins to install. 
" Using Vim-Plug to manage plugins. 
"
" TODO: place `plug.vim` in the executable directory of gVim in advance.
"
" Vim Plugin Configuration
" ========================
" 
" vim-plug Plugin Configuration
" ----------------------------
" 
" This is used to install various plugins, you can run `PlugInstall` to start
" installation. You need access to Github to pull the plugins.
"
" Things to note:
"
" 1. For theme plugins such as `gruvbox`, `vim-one`, there may be issues where
"    they don't work correctly after installation, so I suggest you to install 
"    them manually
" 2. `markdown-preview` sometimes fails to be installed and may requires manual
"    migration of an `.exe` file to work.
" 3. Transparency effects require manually downloading and installing a `.dll`
"    file.
"
call plug#begin('$VIMRUNTIME/plugged')

" The Airline plugin.
Plug 'vim-airline/vim-airline'

" An elegant file explorer.
Plug 'preservim/nerdtree'

" Plugin to preview Markdown files in the browser.
Plug 'iamcco/markdown-preview.nvim', {
      \ 'do': { -> mkdp#util#install() },
      \ 'for': ['markdown', 'vim-plug']
      \ }

" The Plugin to show an elegant table of content for Markdown Documents.
Plug 'liuchengxu/vista.vim'

" Plug to cooperate with ipython
Plug 'jpalardy/vim-slime', { 'for': 'python' }

Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

Plug 'lervag/vimtex'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Plug 'rakr/vim-one'

Plug 'preservim/vim-markdown'

" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

Plug 'jiangmiao/auto-pairs' "auto-pairs

Plug 'rust-lang/rust.vim'

call plug#end()


" Specific Configuration of Each Plugin
" -------------------------------------
"
source $VIMRUNTIME/init/plugs/airlinerc.vim
source $VIMRUNTIME/init/plugs/cocrc.vim
source $VIMRUNTIME/init/plugs/ipythonrc.vim
source $VIMRUNTIME/init/plugs/mkdprc.vim
source $VIMRUNTIME/init/plugs/netrwrc.vim
source $VIMRUNTIME/init/plugs/slimerc.vim
source $VIMRUNTIME/init/plugs/vimmdrc.vim
source $VIMRUNTIME/init/plugs/vimtexrc.vim
source $VIMRUNTIME/init/plugs/vistarc.vim
source $VIMRUNTIME/init/plugs/nerdtreerc.vim

