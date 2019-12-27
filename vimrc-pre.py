import vim
import urllib.request
import os
import os.path


# g:fs_init
vim.command("let g:fs_init = 0")


# install vim-plug
vim_plug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
vim_plug_dst_path = os.environ['HOME'] + "/.vim/autoload/plug.vim"
if not os.path.isfile(vim_plug_dst_path):
  os.makedirs(os.path.dirname(vim_plug_dst_path), exist_ok=True)
  with urllib.request.urlopen(vim_plug_url) as response,\
    open(vim_plug_dst_path, 'wb') as out_file:
      if response is not None and out_file is not None:
        data = response.read()
        out_file.write(data)
        vim.command("let g:fs_init = 1")
      else:
        print("Can't install vim-plug")
        vim.command("q")
