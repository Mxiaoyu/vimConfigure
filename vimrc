colorscheme smyck
set nocompatible              "be iMproved, required
set t_Co=256
filetype off                  "required
syntax keyword cppSTLtype initializer_list

" 插件安装
set runtimepath+=~/.vim/bundle/Vundle.vim "set the runtime path to include Vundle and initialize
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/indent-guide.vim
set runtimepath^=~/.vim/bundle/vim-fswitch.vim
set runtimepath^=~/.vim/bundle/vim-cpp-enhanced-highlight.vim
set runtimepath^=~/.vim/bundle/ctrlsf.vim
set runtimepath^=~/.vim/bundle/vim-multiple-cursors.vim
set runtimepath^=~/.vim/bundle/nerdcommenter.vim

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set number
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
%retab!
"set nowrap
set autoindent
set laststatus=2

set cursorline
set cursorcolumn

" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

set wildmode=list:longest

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'file:///~/.vim/bundle/nerdtree.vim/autoload/nerdtree.vim'
Plugin 'bling/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " 打开文件类型检测


func SetTitle()
"如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "\#########################################################################")
        call append(line(".")+1, "\#" )
        call append(line(".")+2, "\# Copyright (c) ".strftime("%Y")." Baidu.com, Inc. All Rights Reserved" )
        call append(line(".")+3, "\#" )
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\# File Name: ".expand("%"))
        call append(line(".")+7, "\# Date: ".strftime("%c"))
        call append(line(".")+8, "\#########################################################################")
        call append(line(".")+9, "")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "# -*- coding:utf-8 -*-")
        call append(line(".")+1,"\#########################################################################")
        call append(line(".")+2, "\#" )
        call append(line(".")+3, "\# Copyright (c). ".strftime("%Y")." Baidu.com, Inc. All Rights Reserved" )
        call append(line(".")+4, "\#" )
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "\"\"\"" )
        call append(line(".")+7, " File Name: ".expand("%"))
        call append(line(".")+9, " Date: ".strftime("%c"))
        call append(line(".")+10, "\"\"\"")
        call append(line(".")+11, "")
    endif
    if &filetype == 'c'
        call setline(1, "/*************************************************************************")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+3, "* Date: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "/*************************************************************************")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+2, "* Date: ".strftime("%c"))
        call append(line(".")+3, "************************************************************************/")
        call append(line(".")+4, "")
    endif
    if &filetype == 'go'
        call setline(1, "/*************************************************************************")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+2, "* Date: ".strftime("%c"))
        call append(line(".")+3, "************************************************************************/")
        call append(line(".")+4, "")
    endif
endfunc

highlight Search cterm=bold,underline ctermbg=0 ctermfg=3
" show trailing space(s): http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+$/
" autocmd vimenter * NERDTree
" 把光标初始化在非目录方
wincmd w
autocmd VimEnter * wincmd w

" 判断是否该退出
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1

let g:airline#extensions#tabline#enabled = 1  "开启tabline
let g:airline#extensions#tabline#left_sep = ' '  "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'  "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#buffer_nr_show = 1  "tabline中buffer显示编号
let g:airline_section_b = '%{strftime("%m/%d/%y - %H:%M")}'  "底部栏显示时间

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" 按下 F2 调出/隐藏 NERDTree
map <F2> :NERDTreeToggle<CR>

" 快捷键 i 开/关缩进可视化
nmap <silent> <leader>i <Plug>IndentGuidesToggle
" *.cpp 和 *.h 间切换
nmap <silent> <leader>fw :FSHere<CR>
nmap <silent> <leader>z zM
nmap <silent> <leader>a zR

" 映射切换buffer的键位
nnoremap <F3> :bp<CR>
nnoremap <F4> :bn<CR>
nnoremap <F10> :call SetTitle()<CR>

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>db :bd<CR>
map <leader>c :nohl<CR>

map <leader>w <ESC>:w<CR>
imap <leader>w <ESC>:w<CR>
