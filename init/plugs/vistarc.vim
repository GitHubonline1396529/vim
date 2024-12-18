" Configuration for Vim Vista Plugin
"  
" Name: vistarc.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" See Also: https://github.com/liuchengxu/vista.vim
"
" Show the nearest method/function in the statusline
" --------------------------------------------------
" 
" Note: This is only supported for ctags and coc executive for now.
" Do the following to show the nearest method/function in statusline:
"
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
 
" Options
" -------
"
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree 
" renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit 
" executive instead of the default one for these filetypes when using 
" `:Vista` without specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate
" ctags output for some certain filetypes.The file path will be appened to
" your custom command.
"
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to 
" fzf#vim#with_preview()
"
" For example:
let g:vista_fzf_preview = ['left:50%']

" Ensure you have installed some decent font to show these pretty symbols,
" then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend
" it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


