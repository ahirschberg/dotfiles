set nobomb
set nobinary

" gf always opens file, even if it does not exist
map gf :e <cfile><CR>

" Setup colors and theme
if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set bg=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

" setup editor guides
set cursorline
set number
set relativenumber
set colorcolumn=81

" Autocmd for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

set iskeyword+=\-       " set autocomplete to include hyphens

" enable hard mode and tweak enabled buffers
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = ['NERD_tree']

map <F6> :tabe ~/.config/nvim/
map <leader>nn :NERDTreeToggle<CR>
map <leader>y "+y
map <leader>o 2o<esc>O
map <leader>O 2O<esc>O

let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsUsePythonVersion = 3

" Syntastic:
" disable for asm files
let g:syntastic_mode_map= { "passive_filetypes": ["asm"] }
" ,st to toggle
nnoremap <leader>st :SyntasticToggleMode<CR>
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Remap C-L to exit insert mode
imap <C-L> <Esc>

" LaTex
autocmd FileType tex call AuTex()
function! AuTex ()
    inoremap <c-a> \
    nnoremap <F5> :!pdflatex %<CR>
    imap <leader>bt \begin{tabular}{l\|r}<cr>\end{tabular}<esc>==kA
    imap <leader>be \begin{enumerate}<cr>\end{enumerate}<esc>==kA
endfunction


" Java - print and main binds, class boilerplate
autocmd Filetype java call AuJava()
function! AuJava ()
    inoremap <buffer> Sop System.out.print
    inoremap <buffer> Psvm public static void main(String[] args) {<cr>}<esc>O
	" TODO not working
    nnoremap <buffer> <F5> execute '!javac % && java ' . expand("%:t:r")
endfunction

autocmd BufNewFile *.java
  \ exe "normal Opublic class " . expand("%:t:r") . " {\n}\<Esc>1G"

