" NERDTree Plugin Configuration
"
" Name: color.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
"
" Basic settings
" --------------
"
" let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode = 2 " Change current folder as root
" autocmd BufEnter * if (winnr("$") == 1
"     \ && exists("b:NERDTree")
"     \ && b:NERDTree.isTabTree()) |cd %:p:h |endif

" UI settings
" -----------
"
" let NERDTreeQuitOnOpen = 1 " Close NERDtree when files was opened
" let NERDTreeMinimalUI = 1 " Start NERDTree in minimal UI mode (No help lines)
let NERDTreeDirArrows = 1 " Display arrows instead of ascii art in NERDTree
" let g:NERDTreeHidden = 1 " Don't show hidden files
" let NERDTreeWinSize=30 " Initial NERDTree width
" let NERDTreeAutoDeleteBuffer = 1 " Auto delete buffer deleted with NerdTree
" let NERDTreeShowBookmarks=0 " Show NERDTree bookmarks
"
" Hide temp files in NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']
" let g:NERDTreeShowLineNumbers = 1  " Show Line Number
"
" Open Nerdtree when there's no file opened
" autocmd vimenter * if !argc()|NERDTree|endif
"
" Or, auto-open Nerdtree
" autocmd vimenter * NERDTree
"
" Customize icons on Nerdtree
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
"
" Or, the following type
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTREE-GIT
" ------------
"
" Special characters
" let g:NERDTreeGitStatusIndicatorMapCustom = { 
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

" NERDTree-Tabs
" -------------
"
" Auto-open Nerdtree-tabs on VIM enter
" let g:nerdtree_tabs_open_on_console_startup = 0

" Nerdtree-devicons
" -----------------
"
" Nerdtree-syntax-highlighting
" let g:NERDTreeDisableFileExtensionHighlight = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
"
" enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFolders = 1
"
" highlights the folder name
" let g:NERDTreeHighlightFoldersFullName = 1
"
" this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor = {}
