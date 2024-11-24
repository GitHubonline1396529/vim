" Vim NERDTree Plugin Keymapping Settings
" 
" Name: nerdtreekm.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529"
"
" Set Up File Manager Shortcuts
"
" Default NERDTree key binding
" ============================
"
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" When using a narrow window, increase width and open the file manager
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

" Backup Solution
" ===============
"
" Especially For Chinese Vimers: If NERDTree cannot be installed for some 
" reason (Which, I guess, we all known), you can consider using the following 
" alternative approach, which only requires Vim's native Netrw.
"
" " Shortcut: \ + e
" map <Leader>e :call VexBar()<CR>
" imap <Leader>e :call VexBar()<CR>

" let s:verbar_feature = 0

" " Due to implementation constraints, the functionality to open and close 
" " the file manager has to be implemented in the same function.
" func! VexBar()
"     if s:verbar_feature == 0
"         let s:verbar_feature = 1
"         let win_state = winrestcmd()
"         let is_maximized = win_state =~# '^\s*normal'
" 	let &columns += 20
"         Vex
"     else 
" 	let s:verbar_feature = 0
"         let winnr = winnr('$')  " Get the current number of windows
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
"             " Close the leftmost window
"         else
"             echo "Only one window, cannot close."
"         endif
" 	let &columns -= 20
"     endif
" endfunc

