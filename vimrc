call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
call plug#end()

set number
" iabbrev fs-copy Copyright 2019 F.S., all rights reserved. 
set encoding=utf-8
inoremap jk <esc>
inoremap <esc> <nop>

let g:ycm_add_preview_to_completeopt = 0
