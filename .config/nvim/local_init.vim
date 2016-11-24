set nobomb
set nobinary

" gf always opens file, even if it does not exist
map gf :e <cfile><CR>

" Setup colors and theme
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " terminal binds
    tnoremap <esc> <c-\><c-n>
    nnoremap <leader>tt :exec(':botright vs enew \| call termopen($SHELL) \| startinsert')<cr>
endif

if has("persistent_undo")
    set undofile
endif

set bg=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

" setup editor guides
set cursorline
set number
set relativenumber
set colorcolumn=81

nnoremap <F5> :make<CR>
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype tex nnoremap <F5> :!pdflatex %<CR>
autocmd Filetype tex inoremap <c-a> \

set iskeyword+=\-       " set autocomplete to include hyphens

" enable hard mode and tweak enabled buffers
let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = ['NERD_tree']

map <F6> :tabe ~/.config/nvim/
map <leader>nn :NERDTreeToggle<CR>
map <leader>y "+y
map <leader>o 2o<esc>O
map <leader>O 2O<esc>O

if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Syntastic:
" disable for asm files
let g:syntastic_mode_map= { "passive_filetypes": ["asm"] }
" ,st to toggle
nnoremap <leader>st :SyntasticToggleMode<CR>
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_java_javac_config_file_enabled = 1

" fix bootstrap binds
nunmap YY
nnoremap <leader>p "+gp<CR>
nunmap XX
