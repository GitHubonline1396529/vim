" Vim Color Configuration
"
" Name: color.vim
" Author: GitHubonline1396529
" Date: 2024/11/24
" License: MIT License Copyright (c) 2024 GitHubonline1396529
"
" Description: Vim Editor Theme and Airline Theme Configuration
" 
" The main window of the Vim editor and the corresponding Airline colors, 
" themes, etc., are set here. These settings can be adjusted as needed. This
" file is included in .vimrc using the source command.
"
" Note: The specified themes in this file must be installed separately instead
" of using Vim-Plug.
"
" Vim Theme Settings
" ==================
"
" General theme setting
colorscheme one

" The following code demonstrates how to use different themes for terminal and
" GUI modes to better adapt to Windows Terminal aesthetics, and how to set
" different color schemes for specific programming languages. This is provided
" for reference only.
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

" Airline Theme Settings
" ======================
"
" General theme setting
let g:airline_theme="one"

" The following code demonstrates how to use different themes for terminal and
" GUI modes to better adapt to Windows Terminal aesthetics, and how to set
" different color schemes for specific programming languages. This is provided
" for reference only.
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
"
" Tab Bar Appearance
" ==================

" hi User1 cterm=none ctermfg=gray ctermbg=darkgray
" hi User2 cterm=none ctermfg=darkgrey ctermbg=gray
" hi User3 cterm=bold ctermfg=darkgrey ctermbg=gray
" hi User4 cterm=bold ctermfg=yellow ctermbg=gray
" hi User5 cterm=none ctermfg=darkgrey ctermbg=gray
" hi User6 cterm=none ctermfg=darkgrey ctermbg=gray
" 
" Highlight settings for the selected tab
"
" hi SelectTabLine term=Bold cterm=Bold ctermfg=DarkYellow ctermbg=LightGray
" hi SelectPageNum cterm=None ctermfg=DarkRed ctermbg=LightGray
" hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=LightGray
" 
" Highlight settings for unselected tabs
"
" hi NormalTabLine cterm=None ctermfg=Gray ctermbg=DarkGray
" hi NormalPageNum cterm=None ctermfg=Gray ctermbg=DarkGray
" hi NormalWindowsNum cterm=None ctermfg=Gray ctermbg=DarkGray
" 
" Background color for the tab bar
" hi TabLineFill term=reverse ctermfg=5 ctermbg=7 guibg=#6c6c6c

" Function for Light/Dark Mode Toggle
" ===================================
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

" Transparency Adjustment
" =======================
"
" Create a variable for the current window transparency level
let s:alpha_level=255

" Define a function to adjust window transparency. Decrease transparency from
" 255 to 210 in steps of 15, providing exactly three levels of adjustment.
function AdjustAlpha()
    if s:alpha_level > 210
	let s:alpha_level -= 15
    else
	let s:alpha_level = 255
    endif
    call libcallnr("vimtweak64.dll", "SetAlpha", s:alpha_level)
endfunction

" Note: Older settings for transparency adjustment using predefined commands 
" have been deprecated and are commented out.
"
" command -nargs=0 SetAlpha call SetAlphaFunction()
" function SetAlphaFunction()
"     call libcallnr("vimtweak64.dll", "SetAlpha", 225)
" endfunction
" 
" command -nargs=0 ResetAlpha call ResetAlphaFunction()
" function ResetAlphaFunction()
"   call libcallnr("vimtweak64.dll", "SetAlpha", 255)
" endfunction

