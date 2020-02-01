" Copyright (C) 2020 Francis Sun, all rights reserved.

" check some requirements
if has('python3') == 0
  echoerr "No python3 supported!"
  finish
endif

" set leader 
let mapleader = "\ "

" g:vimrc_dir
let g:vimrc_dir = expand('<sfile>:p:h')

" g:copyright_author
let g:copyright_author = 'Unknown'

" vimrc_pre.py
py3f $HOME/.vim/vimrc_pre.py

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <f12> :YcmCompleter GoToDefinition<CR>

" clang-format
" make sure clang-format.py does exist
let g:clang_format_py_found = 0
if filereadable(g:clang_format_py)
  let g:clang_format_py_found = 1
endif
function! ClangFormatOnWrite()
	let l:lines = "all"
        if g:clang_format_py_found
          execute "py3f" g:clang_format_py
        endif
endfunction
augroup OnSave
	autocmd!
	autocmd BufWritePre *.h,*.cc,*cpp call ClangFormatOnWrite()
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

" set alert for the line length is greater or equal than 80
augroup AutoCmdOverLength80
  autocmd!
  autocmd BufEnter * highlight OverLength80 ctermbg=Magenta ctermfg=White 
        \ guibg=Magenta guifg=White
  autocmd BufEnter * match OverLength80 /\%80v.\+/
augroup END

" edit a file in the same dir of the current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" misc
set number
" iabbrev fs-copy Copyright 2019 F.S., all rights reserved. 
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set hlsearch

" keys
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>/ :noh<CR>
vnoremap J <nop>
vnoremap K <nop>
vnoremap H <nop>
vnoremap L <nop>

"vimrc_post.py
py3f $HOME/.vim/vimrc_post.py
