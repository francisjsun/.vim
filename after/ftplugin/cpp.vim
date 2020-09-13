if exists("g:fs_cpp_loaded")
  finish
endif

let g:fs_cpp_loaded = 1
setlocal cino+=g1 cino+=h1

" youcomplete me
" disable auto inserting header
let g:ycm_clangd_args = ['--header-insertion=never']
" set aditional semantic triggers for c-family, any two characters
let g:ycm_semantic_triggers = {
      \ 'c,cpp,objc': ['re!\w{2}'],
      \ }

" gdb settings
packadd termdebug

function! s:fs_cpp_start_gdb()
  mksession! session.vim
  only
  let l:debug_target = ""

  " TODO move debug_info into project file 
  " if has_key(g:fs_cfg, 'debug_info')
  "   let l:debug_info = g:fs_cfg['debug_info']
  "   if has_key(l:debug_info, 'target')
  "     let l:debug_target = l:debug_info['target']
  "   endif
  " else
  "   let g:fs_cfg['debug_info'] = {'target': "", 'args': ""}
  " endif

  if l:debug_target == ""
    let l:debug_target = input("Debug program path: \n", "", "file")
    let g:fs_cfg['debug_info']['target'] = l:debug_target
    let g:fs_cfg['dirty'] = 1
  endif
  execute "Termdebug " . l:debug_target

  execute "normal \<C-W>p\<C-W>H"
endfunction

function! s:fs_cpp_quit_gdb()
  Gdb
  call term_sendkeys("", "q\<CR>")
  " source Session.vim
endfunction

command! FSStartGDB call s:fs_cpp_start_gdb()
command! FSQuitGDB call s:fs_cpp_quit_gdb()

nnoremap <F5> :Continue
nnoremap <F9> :Break
nnoremap <F10> :Over
