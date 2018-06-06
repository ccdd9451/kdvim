" General Settings
syntax on

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set history=2000   " Length of history
set autoread       " Auto read file after it is changed
set shortmess=atI  " Disable intro message when start vim
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set selection=inclusive
set selectmode=mouse,key
set title          " Change terminal's title
set novisualbell
set noerrorbells
set t_vb=
set tm=500
set viminfo^=%    " Remember info about open buffers on close
set magic         " For regex 
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Set tags loading
set autochdir
set tags=./tags;/

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
