NeoBundle 'morhetz/gruvbox'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'junegunn/vim-slash'

" use this fork of auto-pairs because it adds additional settings
NeoBundle 'optroot/auto-pairs' 
let g:AutoPairsMultilineClose=0
let g:AutoPairsOnlyBeforeClose=1
let g:AutoPairsBalanceImmediately=1
let g:AutoPairsNeverJumpLines=1

" Map leader. This is in local_bundles so that it executes before all the
" <leader> mappings in init.vim
let mapleader=','
