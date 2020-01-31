# Copyright (C) 2020 Francis Sun, all rights reserved.

import vim
import urllib.request
import os
import os.path
import re
import json


def vimrc_pre_find_file(dir, regex):
    if os.path.isdir(dir):
        try:
            cur_files = os.listdir(dir)
        except:
            return None
        for f in cur_files:
            full_path = os.path.join(dir, f)
            if os.path.isdir(full_path):
                ret = vimrc_pre_find_file(full_path, regex)
                if ret is not None:
                    return ret
            else:
                if isinstance(regex, str):
                    regex = re.compile(regex)
                if regex.match(f):
                    return full_path

        return None


vimrc_config_file_name = "vimrc_config.json"
vimrc_config_file_path = os.path.join(vim.eval("g:vimrc_dir"), \
        vimrc_config_file_name)
vimrc_config_file = None
vimrc_cfg = None

if os.path.isfile(vimrc_config_file_path):
    with open(vimrc_config_file_path) as f:
        try:
            vimrc_cfg = json.load(f)
        except:
            pass

if vimrc_cfg is None:
    vimrc_config_file = open(vimrc_config_file_path, 'w')
    vimrc_cfg = {}


# clang format
cfg_key_clang_format_py_path = 'clang_format_py_path'
if cfg_key_clang_format_py_path in vimrc_cfg:
    clang_format_py_path = vimrc_cfg[cfg_key_clang_format_py_path]
else:
    # search for file clang-format.py
    clang_format_py_search_dir = "/usr"
    clang_format_py_filename = "clang-format.py"
    clang_format_py_path = vimrc_pre_find_file( \
            clang_format_py_search_dir, clang_format_py_filename)

    vimrc_cfg[cfg_key_clang_format_py_path] = clang_format_py_path

if clang_format_py_path is not None:
    vim.command("let g:clang_format_py = " + "\"" + clang_format_py_path + \
            "\"")


# copyright author
cfg_key_copyright_author = "copyright_author"
if cfg_key_copyright_author in vimrc_cfg:
    vim.command("let g:copyright_author = " + "\"" + \
            vimrc_cfg[cfg_key_copyright_author] + "\"")
else:
    vimrc_cfg[cfg_key_copyright_author] = "Unknown"


# save cfg file
if vimrc_config_file is not None:
    json.dump(vimrc_cfg, vimrc_config_file)
    vimrc_config_file.close()
