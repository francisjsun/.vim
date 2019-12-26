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


" autochdir
if exists('+autochdir')
  set autochdir
else
  augroup OnEnterBuffer
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
  augroup END
endif


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1


" clang-format
let g:clang_format_py = "/usr/share/vim/addons/syntax/clang-format.py"
if filereadable(g:clang_format_py)
  let g:clang_format_py_found = 1
else
  let g:clang_format_py_found = 0
  echoerr "Missing clang_format.py file"
endif

function! FormatOnSave()
	let l:formatdiff = 1
        if g:clang_format_py_found
          execute "py3f" g:clang_format_py
        endif
endfunction

augroup OnSave
	autocmd!
	autocmd BufWritePre *.h,*.cc,*cpp call FormatOnSave()
augroup END
