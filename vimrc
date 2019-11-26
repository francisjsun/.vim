call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
call plug#end()

set number
" iabbrev fs-copy Copyright 2019 F.S., all rights reserved. 
set encoding=utf-8
inoremap jk <esc>
inoremap <esc> <nop>
set ignorecase
set smartcase
set incsearch
let g:ycm_autoclose_preview_window_after_completion = 1
