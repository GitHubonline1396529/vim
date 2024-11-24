" Vim Keymapping for Coc.Nvim Plugin
" 
" Name: coclistkm.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529"
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


