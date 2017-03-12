
set softtabstop=4
set mouse=nvc " set vim to capture mouse in normal, visual, and command mode

" enable powerline symbols for a patched powerline font
" if you don't have a powerline font, you will see weird symbols unless this
" is set to 0
let g:airline_powerline_fonts = 1

" gf always opens file, even if it does not exist
map gf :e <cfile><CR>

" Setup colors and theme
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " terminal binds
    tnoremap <esc> <c-\><c-n>
    nnoremap <leader>tt :exec(':botright vs enew \| call termopen($SHELL) \| startinsert')<cr>
endif

" Colorscheme:
set bg=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

" Editor:
set cursorline
set number
set relativenumber
set colorcolumn=81

" Filetypes tweaks:
nnoremap <F5> :make<CR>
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype tex nnoremap <F5> :!pdflatex %<CR>
autocmd Filetype tex inoremap <c-a> \

" Editor meta:
" set autocomplete to include hyphens for certain filetypes
autocmd Filetype html,erb,javascript,css,scss setlocal iskeyword+=\-
" help window in vertical split: when help opened, moves to a vert
autocmd FileType help wincmd L
map <F6> :tabe ~/.config/nvim/
" map <leader>y "+y
" map <leader>p "+p

" Plugins:
" TODO move plugin cfg to local_bundles or update structure
if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Syntastic:
" disable for asm files since there are many different types
let g:syntastic_mode_map= { "passive_filetypes": ["asm"] }
" leader+st to toggle
nnoremap <leader>st :SyntasticToggleMode<CR>
let g:syntastic_java_javac_config_file_enabled = 1
