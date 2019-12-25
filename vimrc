call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
call plug#end()

" keys
let mapleader = "\ "
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" misc
set number
" iabbrev fs-copy Copyright 2019 F.S., all rights reserved. 
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=2
set softtabstop=2
let g:ycm_autoclose_preview_window_after_completion = 1

function! FormatOnSave()
	let l:formatdiff = 1
	py3f /usr/share/vim/addons/syntax/clang-format.py
endfunction

augroup OnSave
	autocmd!
	autocmd BufWritePre *.h,*.cc,*cpp call FormatOnSave()
augroup END
