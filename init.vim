" Initialization for Vim Configuration 
"
" Name: init.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
" 
" Vim configuration file for gVim 9.1 or later versions on Windows Operation
" System. (Theoretically portable across platforms, but such attempts have not
" been made in this project.)
"
" Directory Instructions: Place this file and the corresponding `init` folder
" in Vim's installation directory, rather than the user home directory as is
" common in Unix/Linux systems. This is to accommodate the limited C drive
" space on Windows, as Vim is typically installed on the D drive or another
" partition.
"
" Add the following line to your `.vimrc` file:
"
"     source $VIMRUNTIME/init.vim
"
" If you prefer to follow traditional conventions or change the configuration 
" path, you will need to locate all occurrences of `$VIMRUNTIME` in this file
" (`$VIMRUNTIME` automatically points to Vim's installation directory) and
" replace them with the dictionary where you want to install this configuration
" at. You can make some other necessary adjustments accroding to your specific
" demand. Detailed instructions are omitted, also see `README.md`."
"
" ===================
" Key Custom Settings
" ===================
"
" Import Dependent Configurations
" ===============================
"
source $VIMRUNTIME/init/color.vim " Color Configurations
source $VIMRUNTIME/init/plugrc.vim " Import Plugin Configurations
source $VIMRUNTIME/init/keymap.vim " Customize Hotkeys and Related Functions

" WARNING: This section is critical and requires targeted modifications for any
" configuration migration. Pay extra attention!
"
" ==============
" Basic Settings
" ==============
"
" This section defines some fundamental Vim settings, including but not limited
" to font, window size, indentation rules, code folding, file encoding, and
" styles.
"
" Specifying the Python Installation Path
" =======================================
"
" Some plugin functionalities depend on Python. You need to specify and adjust
" this setting.
"
" set pythonthreedll=D:\Python\Python39\python39.dll

" ====================
" File Format Settings
" ====================
"
set modelines=0 " Disable modelines (Security measure)
filetype on " Enable file type detection
set encoding=utf-8 " Encoding Setting
set termencoding=utf-8 " Encoding Setting
set fileencoding=utf-8 " Encoding Setting

" Display Settings
" ================
"
" Set the window size in GUI mode to default to 25 rows and 80 columns, which
" conforms to general programming habits.
"
" The number written here is 85, this is because the line numbering is enabled 
" by default, these line numbers always occupy some width, default to be 5
" characters.
"
if has('gui_running')
    set lines=25 columns=85
endif

syntax on " Enable syntax
set number " Enable line number
set sm! " Highlight matching parentheses
set hlsearch " Highlight Search Matchings
set cursorline " Highlight the current cursor line
set termguicolors " Enable Terminal GUI color

set showmatch " Show Match
set ruler " Show the cursor vertical position in the bottom right corner
set novisualbell " Disable cursor twinkling
set showcmd " Show inputed commands

set laststatus=2 " always show statusline
" set showtabline=2 " always show tabline
set showtabline=0 " always show tabline
set vb t_vb=

set conceallevel=0 " Disable virtual characters

" Due to the logic defined in 'keymap. vim' that allows users to use hotkeys to
" switch the display mode of line numbers, there is no need to specific using 
" relative line number mode in the main configuration file.
"
" See also `init/keymap.vim`
"
" set relativenumber " Show relative line number

" =============
" Edit Settings
" =============
"
set smartindent " Set smart indent
set autoindent " Set autoindent
set smarttab " Set smart tabs

" For Python Script Files
if expand("%:e") == "py"
    set expandtab " Use spaces replacing tab
else
    " Ensure that the Tab key input is still the Tab character, not spaces
    set noexpandtab 
endif

" The following part of code is designed to disable some of these folloing
" configurations while editing makefile. However, It seed to be not working
" well. 
"
" Theoretically `autocmd BufRead,BufNewFile *` should trigger the command every
" time a file is read or created.
"
" autocmd BufRead,BufNewFile * if expand("%:t") =~? '^makefile$' |
"     \ set tabstop=4 |
"     \ set shiftwidth=4 |
"     \ set expandtab |
"     \ endif

set tabstop=8 " Specifies the width of a tab in the editor
set shiftwidth=4 " Sets the width for automatic indentation

set splitright " New windows appear on the right side during vertical splits
set splitbelow " New windows appear below during horizontal splits

set nobackup " Disables backup files
set nowritebackup " Disables write backup files
set noswapfile " Disables temporary swap files
set autoread " Automatically detect external file changes
set clipboard=unnamed " Share the clipboard with the system

" set nocompatible " Disables strict vi compatibility mode
set ambiwidth=double " Fixes display issues with Chinese punctuation
" set nowrap " Disable automatic line wrapping
set mouse=a " Enables mouse support
set mousehide " Hides the mouse cursor while typing

" Automatically scrolls 10 characters to the right when moving to unseen text
set sidescroll=10 

" ctag configurations
set tags=./tags,./TAGS,tags;,TAGS;
set autochdir

" set paste " Keeps formatting while pasting

" Code folding settings
" =====================
"
set nofoldenable " Disables automatic code folding when Vim starts
" set foldmethod=indent " Enables folding based on indentation
" setlocal foldlevel=99 " Sets the fold level to 99

" Cursor style settings
" Sets cursor to an I-beam in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 

" Sets cursor to a block in replace mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7" 

" Sets cursor to a block in normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 

" GUI Window Settings
" ===================
"
" Configures auto-completion behavior to match an IDE
set completeopt=longest,menu 

" Allows backspace to delete characters across indentations, line ends, and at
" the start of lines
set backspace=indent,eol,start 

" Font and font size settings, applicable only to GUI clients. 
" Terminal users need to adjust terminal fonts and sizes separately.
"
set guifont=Consolas\ for\ Powerline\ FixedD:h12
"
" Besides Consolas, the following two Powerline-compatible fonts also work fine
" on Windows. Other Powerline fonts seem to be functional only on GNU/Linux 
" platforms for unknown reasons.
"
" set guifont=Ububtu\ Mono:h12
" set guifont=Meslo\ LG\ S\ for\ Powerline:h12

" set guifont=Hack\ Nerd\ Font\ Mono:h12
" Setting different fonts for Western and East Asian characters.
" Commented out to ensure compatibility with plugins.
set guifontwide=SimHei:h12

" If you dislike Powerline font or prefer to use Nerd Font instead
"
" set guifontwide=Hack\ Nerd\ Font\ Mono:h12

" Disable scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Disable menu and toolbar
set guioptions-=m
set guioptions-=T

