" Copyright (C) 2020 Francis Sun, all rights reserved.

" g:vimrc_dir
let g:vimrc_dir = expand('<sfile>:p:h')

" set leader 
let mapleader = "\ "

" filename completion
if has("wildmenu")
  set wildmenu
  set wildmode=longest:full,list:full
endif

syntax on

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

" pymode
let g:pymode_options_colorcolumn = 0

" misc
set number
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set hlsearch

" keys
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>s :update<CR>
vnoremap J <nop>
vnoremap K <nop>
vnoremap H <nop>
vnoremap L <nop>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" plugins

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <f12> :YcmCompleter GoToDefinition<CR>
