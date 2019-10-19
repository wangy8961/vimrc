"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Version: 2.0
" Email: wangy8961@163.com
" Description: Vim 配置文件
" Author: Madman (https://madmalls.com)
" Date:   2019-08-29 11:28:51
" Last Modified by:   Madman
" Last Modified time: 2019-08-29 11:28:51
"
" Sections:
"    -> 通用配置
"    -> 外观显示
"    -> 搜索
"    -> 快捷键映射
"    -> 语言相关
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 通常源代码文件都使用了诸如 git 等版本控制软件，所以在修改文件前无需备份、不用为缓冲区创建临时文件
set nobackup    " 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
set nowritebackup
set noswapfile  " 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp

" 保留撤销历史。Vim 会在编辑时保存操作历史，用来供用户撤消更改。默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了
" 打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在。这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以 .un~ 开头
set undofile

" 如果上面开启了 backup、swapfile、undofile，设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的 // 表示生成的文件名带有绝对路径，路径中用 % 替换目录分隔符，这样可以防止文件重名
" set backupdir=~/.vim/.backup//
" set directory=~/.vim/.swp//
" set undodir=~/.vim/.undo//

" Enable the use of the mouse.  Only works for certain terminals (GUI, MS-DOS and Win32)
" set mouse=a

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录
set autochdir

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），保存时会发出提示 WARNING: The file has been changed since reading it!!!
set autoread

" 设置 Vim 能够记住多少条命令历史操作记录
set history=1000

" 出错时，不要发出响声
set noerrorbells
" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" 开启英语单词的拼写检查 (开启后中文字会有背景色，不好看)
" set spell spelllang=en_us

" 开启文件类型检查
filetype on
" 自动载入与该类型对应的缩进规则。比如，如果编辑的是 .py 文件，Vim 就是会找 Python 的缩进规则 ~/.vim/indent/python.vim
filetype indent on
" 激活 Vim 内置的插件功能，将可以使用诸如 netrw、omni-completion 等功能
filetype plugin on

" 开启语法高亮，自动识别代码，使用多种颜色显示
syntax on

" 在底部状态栏显示正在输入的命令，比如在普通模式下按 d 键，则会显示 d 并等待你输入 {motion} 等指令
set showcmd

" 在底部状态栏显示当前 Vim 的模式
set showmode

" 命令模式下，按下 Tab 键可以自动补全命令。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 字符编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

" 默认使用 unix 文件风格的换行符 \n
" Windows(MS-DOS): \r\n
" Mac OS X: \n
" Mac OS 9: \r
set ffs=unix,dos,mac

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" Do smart autoindenting when starting a new line.
set smartindent

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4
" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4
set softtabstop=4

" 默认通过鼠标右键粘贴时，会在行首多出许多缩进和空格，此选项可以解决任何格式变形、胡乱缩进等问题
set paste

" .vimrc 文件内容一旦变更后，立即生效 (否则需要先保存 .vimrc 再用 vim 命令打开其它文件)
autocmd BufWritePost $MYVIMRC source $MYVIMRC



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 外观显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" 背景色
set background=dark

" 主题
" colorscheme molokai

" 高亮显示当前行
set cursorline
highlight CursorLine cterm=NONE ctermbg=DarkBlue ctermfg=White guibg=DarkBlue guifg=White
" 高亮显示当前列
set cursorcolumn
highlight CursorColumn cterm=NONE ctermbg=DarkBlue ctermfg=White guibg=DarkBlue guifg=White

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

" 显示行号
set number

" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
" set relativenumber

" 设置行宽，即一行最多显示 80 个字符，如果你复制的内容很多，会被自动切分成多行
" set textwidth=80

" 取消自动折行，即使很长的文本也只在一行显示，不会分成多行显示
set nowrap

" 垂直滚动时，光标距离顶部或底部多少行(即光标所在的当前行不会紧贴屏幕顶部或底部)
set scrolloff=5
" 水平滚动时，光标距离行首或行尾多少个字符(在不折行时比较有用)
set sidescrolloff=15

" 是否显示状态栏: 0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2

" [默认就是打开的] 在状态栏显示光标的当前位置（位于哪一行哪一列）
set ruler


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 搜索时忽略大小写
set ignorecase

" 如果同时打开了 ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索 Test 时，将不匹配 test ；搜索 test 时，将匹配 Test
set smartcase

" 高亮显示匹配项
set hlsearch

" 在输入搜索关键词时，每输入一个字符，光标会自动跳转到第一个匹配项上
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 禁用方向键, 只用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 在命令行模式中回溯历史命令时，避免使用光标键，并且它们会像 <Up> 和 <Down> 那样对历史命令进行过滤
" 比如输入 :normal 后再按 <C-p> 只会回溯以 :normal 开头的历史命令
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" <leader>默认映射到 \ 键，有点远不好按，将它重新映射到 , 键
let mapleader = ","
" 快速保存文件，按 ,w 相当于 :w!回车
nmap <leader>w :w!<cr>

" 按 :W 相当于 :w !sudo tee % > /dev/null，让普通用户可以用 sudo 身份来修改并保存他没有权限的文件，比如 /etc/hosts
" 详情可参考《Vim实用技巧》中技巧 45 以超级用户权限保存文件
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语言相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func SetTitle()
call setline(1, "\#!/usr/bin/python")
call setline(2, "\# -*- coding=utf8 -*-")
call setline(3, "\# @Author : Madman")
call setline(4, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
call setline(5, "\# @Description :")
normal G
normal o
normal o
endfunc
autocmd bufnewfile *.py call SetTitle()
