" Copyright (C) 2020 Francis Sun, all rights reserved.

let g:vimrc_dir = expand('<sfile>:p:h')
let g:copyright_author = 'Unknown'

" vimrc_pre.py
if has('python3')
  py3f $HOME/.vim/vimrc_pre.py
endif


" " vim-plug
" call plug#begin('~/.vim/plugged')
" Plug 'ycm-core/YouCompleteMe'
" Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-vinegar'
" Plug 'tikhomirov/vim-glsl'
" call plug#end()
" 
" if g:fs_init
"   PlugInstall
" endif


" " autochdir
" if exists('+autochdir')
"   set autochdir
" else
"   augroup OnEnterBuffer
"     autocmd!
"     autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
"   augroup END
" endif


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <f12> :YcmCompleter GoToDefinition<CR>


" clang-format
let g:clang_format_py_found = 0
if has("python3")
  if filereadable(g:clang_format_py)
    let g:clang_format_py_found = 1
  endif
endif

if g:clang_format_py_found == 0
  " echoerr "Missing file: " . g:clang_format_py
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


" filename completion
if has("wildmenu")
  set wildmenu
  set wildmode=longest:full,list:full
endif

" moon
command! InsertCopyright call moon#plugin#copyright#InsertCopyright
      \ (expand('%:p'), g:copyright_author)


" indent
set expandtab
set smartindent
set shiftwidth=2
filetype plugin indent on

" misc
set number
" iabbrev fs-copy Copyright 2019 F.S., all rights reserved. 
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set hlsearch

" keys
let mapleader = "\ "
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>/ :noh<CR>
vnoremap J <nop>
vnoremap K <nop>
vnoremap H <nop>
vnoremap L <nop>


"vimrc_post.py
if has('python3')
  py3f $HOME/.vim/vimrc_post.py
endif
